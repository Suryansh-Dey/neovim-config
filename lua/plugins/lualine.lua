local augroup = vim.api.nvim_create_augroup("LualineBuffersMgmt", { clear = true })

local name_cache = {}
vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufFilePost" }, {
    group = augroup,
    callback = function() name_cache = {} end,
})

local function get_listed_buffers()
    local bufs = {}
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[b].buflisted and vim.bo[b].buftype ~= 'quickfix' then
            bufs[#bufs + 1] = b
        end
    end
    return bufs
end

local function delete_buffer(buf_pos, force)
    local bufs = get_listed_buffers()
    local cur = vim.api.nvim_get_current_buf()
    local del_buf = cur
    local del_idx = nil

    if not buf_pos or buf_pos == "" then
        for i, b in ipairs(bufs) do
            if b == cur then
                del_idx = i
                break
            end
        end
    elseif buf_pos == "$" then
        del_idx = #bufs
        del_buf = bufs[del_idx]
    else
        local pos = tonumber(buf_pos)
        if pos and bufs[pos] then
            del_idx = pos
            del_buf = bufs[pos]
        else
            vim.notify("Unable to delete buffer: position out of range", vim.log.levels.ERROR)
            return
        end
    end

    if not del_buf or not vim.api.nvim_buf_is_valid(del_buf) then return end

    -- Determine target buffer: (i+1)-th, or (i-1)-th if deleting the last buffer
    local target_buf = nil
    if del_idx then
        if del_idx < #bufs then
            target_buf = bufs[del_idx + 1]
        elseif del_idx > 1 then
            target_buf = bufs[del_idx - 1]
        end
    end

    -- Switch any window showing del_buf to target_buf (or enew if only buffer)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_buf(win) == del_buf then
            if target_buf then
                vim.api.nvim_win_set_buf(win, target_buf)
            else
                vim.api.nvim_win_call(win, function() vim.cmd("enew") end)
            end
        end
    end

    local cmd = (force and "bdelete! " or "confirm bdelete ") .. del_buf
    local ok = pcall(vim.api.nvim_command, cmd)
    if not ok and vim.api.nvim_buf_is_valid(del_buf) then
        -- User cancelled confirmation, restore window
        pcall(vim.api.nvim_set_current_buf, del_buf)
    end
end

_G.LualineDeleteBuffer = delete_buffer

vim.api.nvim_create_user_command("LualineBuffersDelete", function(opts)
    local arg = opts.args ~= "" and vim.trim(opts.args) or nil
    local force = opts.bang
    if arg and arg:sub(-1) == "!" then
        force = true
        arg = arg:sub(1, -2)
    end
    delete_buffer(arg, force)
end, {
    bang = true,
    nargs = "?",
    desc = "Delete buffer by statusline index (default: current buffer) and open adjacent buffer",
    complete = function()
        local bufs = get_listed_buffers()
        local completions = {}
        for i = 1, #bufs do
            completions[i] = tostring(i)
        end
        completions[#completions + 1] = "$"
        return completions
    end,
})

local function truncate_word(word)
    local limit = math.floor(vim.o.columns / 6)
    local len = vim.api.nvim_strwidth(word)
    if len < limit then
        local pad = limit - len
        return word .. string.rep(" ", pad)
    elseif len > limit then
        return string.sub(word, 1, math.max(0, limit - 1)) .. "…"
    end
    return word
end

local function get_unique_name(filename, bufnr)
    if name_cache[bufnr] then return name_cache[bufnr] end

    local path = vim.api.nvim_buf_get_name(bufnr)

    local clash = false
    for _, b in ipairs(vim.api.nvim_list_bufs()) do
        if b ~= bufnr and vim.bo[b].buflisted then
            local other_path = vim.api.nvim_buf_get_name(b)
            if vim.fs.basename(other_path) == filename and path ~= other_path then
                clash = true
                break
            end
        end
    end

    local result = clash and (vim.fs.basename(vim.fs.dirname(path)) .. '/' .. filename) or filename
    result = truncate_word(result)
    name_cache[bufnr] = result
    return result
end

local ignore = {
    "neo-tree",
    "TelescopePrompt",
    "Messages",
    "qf",
    "NvTerm_vsp",
    "NvTerm_sp"
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    enabled = not vim.g.started_by_firenvim,
    lazy = false,
    priority = 1,
    config = function(_, opts)
        require('lualine').setup(opts)

        local ok, Buffers = pcall(require, 'lualine.components.buffers')
        if ok and Buffers then
            Buffers.bufpos2nr = Buffers.bufpos2nr or {}
            local orig_jump = Buffers.buffer_jump
            Buffers.buffer_jump = function(buf_pos, bang)
                if not Buffers.bufpos2nr or #Buffers.bufpos2nr == 0 then
                    Buffers.bufpos2nr = get_listed_buffers()
                end
                return orig_jump(buf_pos, bang)
            end
        end
    end,
    opts = {
        options = {
            theme = 'auto',
            section_separators = '',
            component_separators = '|',
            ignore_focus = ignore,
            disabled_filetypes = {
                statusline = ignore,
                winbar = ignore,
            },
        },
        sections = {
            lualine_a = {
                {
                    'buffers',
                    icons_enabled = false,
                    mode = 2,
                    max_length = vim.o.columns,
                    fmt = function(name, context)
                        return get_unique_name(name, context.bufnr)
                    end
                }
            },
            lualine_b = {},
            lualine_c = {},
            lualine_x = { 'diagnostics' },
            lualine_y = {},
            lualine_z = {}
        },
        inactive_sections = {
            lualine_a = { { 'filename', color = { fg = '#000000', bg = '#aaaaaa', gui = 'bold' } } },
            lualine_b = {},
            lualine_c = {},
            lualine_x = { 'diagnostics' },
            lualine_y = {},
            lualine_z = {}
        },
        tabline = {},
    }
}
