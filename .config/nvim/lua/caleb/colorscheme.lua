--------------------------------------------------------------------------------
-- My Gruvbox Material theme
--------------------------------------------------------------------------------

vim.cmd [[colorscheme gruvbox-material]]

local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme" .. colorscheme)

if not status_ok then
  return
end
