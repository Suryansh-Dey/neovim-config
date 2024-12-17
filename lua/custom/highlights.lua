local overrides = {
  LineNr = { fg = "#777777" },
  CursorLineNr = { fg = "#ffffff" },

  NvimTreeGitDirty = { fg = "#ffaa00" },     -- Modified files
  NvimTreeGitStaged = { fg = "#ffaa00" },    -- Staged files
  NvimTreeGitDeleted = { fg = "#ff0000" },   -- Deleted files
  NvimTreeGitMerge = { fg = "#00ffff" },     -- Merge conflicts
  NvimTreeGitNew = { fg = "#00ff00" },       -- Untracked files
  NvimTreeGitIgnored = { fg = "#888888" },   -- Ignored files

  GitSignsAdd = { fg = "#00ff00", bg = "NONE" },
  GitSignsChange = { fg = "#ffaa00", bg = "NONE" },
  GitSignsDelete = { fg = "#ff0000", bg = "NONE" },
}
return overrides
