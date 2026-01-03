local name_cache = {}
vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete", "BufFilePost" }, {
    callback = function() name_cache = {} end,
})

local function truncate_word(word)
    local limit = vim.o.columns / 8;
    local len = #word
    if len < limit then
        local pad = limit - len
        return word .. string.rep(" ", pad)
    elseif len > limit then
        return string.sub(word, 1, limit - 1) .. "…"
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
            if vim.fn.fnamemodify(other_path, ':t') == filename and path ~= other_path then
                clash = true
                break
            end
        end
    end

    local result = clash and (vim.fn.fnamemodify(path, ':p:h:t') .. '/' .. filename) or filename
    result = truncate_word(result)
    name_cache[bufnr] = result
    return result
end

return {
    options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '|',
        ignore_focus = {
            "neo-tree",
            "TelescopePrompt",
            "Messages",
            "qf",
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

    tabline = {},
}
