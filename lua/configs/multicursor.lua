local mc = require("multicursor-nvim")
mc.setup()
local set = vim.keymap.set

-- Add or skip cursor above/below the main cursor.
set({ "n", "x" }, "<M-k>", function() mc.lineAddCursor(-1) end)
set({ "n", "x" }, "<M-j>", function() mc.lineAddCursor(1) end)
set({ "n", "x" }, "<M-K>", function() mc.lineSkipCursor(-1) end)
set({ "n", "x" }, "<M-J>", function() mc.lineSkipCursor(1) end)

-- Add or skip adding a new cursor by matching word/selection
set({ "n", "x" }, "<M-n>", function() mc.matchAddCursor(1) end)
set({ "n", "x" }, "<M-N>", function() mc.matchSkipCursor(1) end)
set({ "n", "x" }, "<M-p>", function() mc.matchAddCursor(-1) end)
set({ "n", "x" }, "<M-P>", function() mc.matchSkipCursor(-1) end)

-- Add and remove cursors with control + left click.
set("n", "<c-leftmouse>", mc.handleMouse)
set("n", "<c-leftdrag>", mc.handleMouseDrag)
set("n", "<c-leftrelease>", mc.handleMouseRelease)

-- Mappings defined in a keymap layer only apply when there are
-- multiple cursors. This lets you have overlapping mappings.
mc.addKeymapLayer(function(layerSet)
    -- Select a different cursor as the main one.
    layerSet({ "n", "x" }, "<up>", mc.prevCursor)
    layerSet({ "n", "x" }, "<down>", mc.nextCursor)

    -- Delete the main cursor.
    layerSet({ "n", "x" }, "<M-x>", mc.deleteCursor)

    -- Enable and clear cursors using escape.
    layerSet("n", "<esc>", function()
        if not mc.cursorsEnabled() then
            mc.enableCursors()
        else
            mc.clearCursors()
        end
    end)
end)
