return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()
        local set = vim.keymap.set

        -- Add or skip cursor above/below the main cursor.
        set({ "n", "x" }, "<Up>", function() mc.lineAddCursor(-1) end)
        set({ "n", "x" }, "<Down>", function() mc.lineAddCursor(1) end)
        set({ "n", "x" }, "<S-Up>", function() mc.lineSkipCursor(-1) end)
        set({ "n", "x" }, "<S-Down>", function() mc.lineSkipCursor(1) end)

        -- Add or skip adding a new cursor by matching word/selection
        set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end)
        set({ "n", "x" }, "<C-S-n>", function() mc.matchSkipCursor(1) end)
        set({ "n", "x" }, "<C-p>", function() mc.matchAddCursor(-1) end)
        set({ "n", "x" }, "<C-S-p>", function() mc.matchSkipCursor(-1) end)

        -- Add and remove cursors with Alt + left click.
        set("n", "<M-leftmouse>", mc.handleMouse)
        set("n", "<M-leftdrag>", mc.handleMouseDrag)
        set("n", "<M-leftrelease>", mc.handleMouseRelease)

        -- Mappings defined in a keymap layer only apply when there are
        -- multiple cursors. This lets you have overlapping mappings.
        mc.addKeymapLayer(function(layerSet)
            -- Select a different cursor as the main one.
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)

            -- Delete the main cursor.
            layerSet({ "n", "x" }, "<C-x>", mc.deleteCursor)

            -- Enable and clear cursors using escape.
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
    end
}
