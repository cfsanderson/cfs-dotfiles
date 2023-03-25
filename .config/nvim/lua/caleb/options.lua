---------------------------------------------------------------------------------
-- Options 
---------------------------------------------------------------------------------

local A = vim.api
local g = vim.g
local cmd = vim.cmd

local options = {
  autoindent = true,
  background = "dark",
  backup = true,                            -- creates a backup fillet
  belloff = "all",
  clipboard = "unnamedplus",                -- allows neovim to access the system clipboard
  cmdheight = 2,                            -- more space in the neovim command line for displaying messages
  compatible = false,
  completeopt = { "menuone", "noselect" },  -- mostly just for cmp
  conceallevel = 0,                         -- so that `` is visible in markdown files
  cursorline = false,                       -- highlight the current line
  errorbells = false,
  expandtab = true,                         -- convert tabs to spaces
  fileencoding = "utf-8",                   -- the encoding written to a file
  guifont = "monospace:h17",                -- the font used in graphical neovim applications
  hlsearch = true,                          -- highlight all matches on previous search pattern
  ignorecase = true,                        -- ignore case in search patterns
  incsearch = true,
  number = true,                            -- set numbered lines
  numberwidth = 4,                          -- set number column width to 2 {default 4}
  pumheight = 10,                           -- pop up menu height
  relativenumber = true,                    -- set relative numbered lines
  scrolloff = 5,                            -- is one of my fav
  shiftwidth = 2,                           -- the number of spaces inserted for each indentation
  showtabline = 2,                          -- always show tabs
  sidescrolloff = 5,
  signcolumn = "yes",                       -- always show the sign column, otherwise it would shift the text each time
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indenting smarter again
  softtabstop = 2,                          -- If negative, the shiftwidth value is used
  splitbelow = true,                        -- force all horizontal splits to go below current window
  splitright = true,                        -- force all vertical splits to go to the right of current window
  swapfile = false,                         -- creates a swapfile
  syntax = "ON",                            -- for VimWiki
  tabstop = 2,                              -- insert 2 spaces for a tab
  termguicolors = true,                     -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                         -- faster completion (4000ms default)
  wrap = false,                             -- display lines as one long line
  writebackup = true,                      -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
}

-- :help shortmess - basically shows shortened messages... not sure I want need it.
-- vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

cmd 'set backupdir=$HOME/.vim/backupdir//,.'
cmd 'set undodir=$HOME/.vim/undodir//,.'
cmd 'syntax on'
cmd 'filetype plugin on'
cmd 'display+=lastline' -- When included, as much as possible of the last line in a window will be displayed. "@@@" is put in the last columns of the last screen line to indicate the rest of the line is not displayed.
cmd 'highlight Comment cterm=italic'
cmd "set whichwrap+=<,>,[,],h,l"
cmd [[set iskeyword+=-]]
cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- Airline theme
-- g.airline_theme = 'gruvbox_material'

-- Gruvbox-material settings
g.gruvbox_material_background = 'hard'
g.gruvbox_material_enable_italic = 1
g.gruvbox_material_disable_italic_comment = 0
g.gruvbox_material_menu_selection_background = 'green'
g.gruvbox_material_palette = 'material'
g.gruvbox_material_sign_column_background = 'none'
