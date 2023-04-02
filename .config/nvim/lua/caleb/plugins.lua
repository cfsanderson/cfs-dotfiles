---------------------------------------------------------------------------------
-- Plugins - Packer is set up to Automatically run on file save.
---------------------------------------------------------------------------------
-- if problems arise, removing ~/.config/nvim/plugin/packer_compiled.lua could resolve (it is regenerated after running Packer again and should be put in a .gitignore)

local fn = vim.fn

-- Automatically install packer
-- /Users/caleb/.local/share/nvim/site/pack/packer/
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file - I didn't like it so shut it off ;) 
-- make sure to save AND source this file before running Packer
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print("packer failed")
  vim.notify("packer failed")
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

---------------------------------------------------------------------------------
-- Install your plugins here
---------------------------------------------------------------------------------
return packer.startup(function(use)
  use "wbthomason/packer.nvim"         -- Have packer manage itself
  use "nvim-lua/popup.nvim"            -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim"          -- Useful lua functions used by lots of plugins
	use 'lewis6991/impatient.nvim'       -- impatient for speedier loading of modules

  -- stuff from old config - may not need anymore???
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sensible'
  use { 'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview' }

  -- my colorscheme
  -- use { 'cfsanderson/cfs-gruvbox-material', branch = 'dev-cfs' }
  use 'sainnhe/gruvbox-material'

  -- cmp plugins
  use "hrsh7th/nvim-cmp"               -- The completion plugin
  use "hrsh7th/cmp-buffer"             -- buffer completions
  use "hrsh7th/cmp-path"               -- path completions
  use "hrsh7th/cmp-cmdline"            -- cmdline completions
  use "saadparwaiz1/cmp_luasnip"       -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"           -- vim/nvim ??
  use "hrsh7th/cmp-nvim-lua"           -- all the nvim/vim completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- snippet library

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- cause Telescope 
  -- if/when I'm on Linux this imgage viewer extension would be rad
  -- https://github.com/nvim-telescope/telescope-media-files.nvim
  -- config for this and other telescope extensions are in lua/caleb/telescope.lua

  -- Treesitter (TS)
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "p00f/nvim-ts-rainbow"
 
  -- TS playground helps to understand how TS is defining things. Maybe install later if necessary.
  -- use "nvim-treesitter/playground"

  -- VimWiki 
  use "vimwiki/vimwiki"
  -- consider lazy loading
  -- use {
  --   "vimwiki/vimwiki",
  --   cmd = "VimwikiIndex",
  --   -- setup = function() require "vimwiki" end
  -- } 

  -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-autopairs"

  -- Comments
  use "numToStr/Comment.nvim"                             -- basic comments with gcc and gc in Visual mode
  use 'JoosepAlviste/nvim-ts-context-commentstring'       -- Treesitter context aware comments for JSX 

  -- Gitsigns - git stuff
  use "lewis6991/gitsigns.nvim"

  -- Nvim-tree 
  -- use 'kyazdani42/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'
  
  -- Neo-tree
  -- :let g:loaded_netrw       = 1
  -- :let g:loaded_netrwPlugin = 1
  -- Unless you are still migrating, remove the deprecated commands from v1.x
  -- vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
-- Unless you are still migrating, remove the deprecated commands from v1.x
  vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = { 
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
