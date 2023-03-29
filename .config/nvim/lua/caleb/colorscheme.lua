--------------------------------------------------------------------------------
-- colorscheme
--------------------------------------------------------------------------------
-- Gruvbox-material settings
-- local g = vim.g

-- Override color palette. The available keys can be found in
-- `/path/to/gruvbox-material/autoload/gruvbox_material.vim`.
-- 
-- E.g.
--     let g:gruvbox_material_colors_override = {'bg0': ['#1d2021', '234'], 'bg2': ['#282828', '235']}
--     colorscheme gruvbox-material
--     Type:               |Dictionary|
--     Default value:      `{}`

-- g.gruvbox_material_colors_override = {'fg0': ['#E1D7C7', '223']}
-- g.gruvbox_material_background = 'hard'
-- g.gruvbox_material_palette = 'material'
-- g.gruvbox_material_enable_italic = 1
-- g.gruvbox_material_disable_italic_comment = 0
-- g.gruvbox_material_menu_selection_background = 'green'
-- g.gruvbox_material_sign_column_background = 'none'
-- g.gruvbox_material_better_performance = 1

local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
