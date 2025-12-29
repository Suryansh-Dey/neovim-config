return {
    options = {
        theme = 'auto',
        section_separators = '',
        component_separators = '|',
    },
    sections = {
        lualine_a = {
            {
                'buffers',
                show_filename_only = true,
                hide_filename_extension = false,
                show_modified_status = true,
                mode = 2,
                max_length = vim.o.columns
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
