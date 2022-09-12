---------------------------------------------------------------------------------
-- Keymaps
---------------------------------------------------------------------------------

local opts = { noremap = true, silent = true }

local loud = { silent = false }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-------------------------------------
-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",
-------------------------------------

-------------------------------------
-- Normal --
-------------------------------------
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- " use F1 to toggle search highlight
keymap("n", "<F1>", ":set hlsearch!<cr>", opts)

-- " use F2 to insert current date in 'Day DD Mon YYYY' format
keymap("n", "<F2>", "i<C-R>=strftime('%a %d %b %Y')<CR><Esc>", opts)

-- " use F3 to insert current time in HH:MM:SS format
keymap("n", "<F3>", "i<C-R>=strftime('%H:%M:%S')<CR><Esc>", opts)

-- Navigate buffers w/ shift l and h
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Open FZF
-- keymap("n", "<leader>f", ":FZF", loud)

-- source current file
keymap("n", "<leader>so", ":source %<cr>", loud)

-------------------------------------
-- Visual --
-------------------------------------
-- Stay in indent mode - keeps tabs moving, not just once
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- keeps the same thing in yank until you yank again
keymap("v", "p", '"_dP', opts) 

-------------------------------------
-- Visual Block --
-------------------------------------
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-------------------------------------
-- Insert
-------------------------------------
-- " use F2 to insert current date in 'Day DD Mon YYYY' format
keymap("i", "<F2>", "<C-R>=strftime('%a %d %b %Y')<CR>", opts)

-- " use F3 to insert current time in HH:MM:SS format
keymap("i", "<F3>", "<C-R>=strftime('%H:%M:%S')<CR>", opts)

-------------------------------------
-- Telescope --
-------------------------------------
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope<cr>", opts)
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-------------------------------------
-- Nvimtree
-------------------------------------
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-------------------------------------
-- Terminal --
-------------------------------------
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-------------------------------------
-- Old things to maybe get working someday
-------------------------------------
-- toggle NERDTree
-- map <leader>n :NERDTreeToggle<cr>
-- keymap("n", "<leader>n", ":NERDTreeToggle<cr>", opts)

-- using * to search or visual selection this enters the replace command a'd
-- puts your cursor in line to accept the term to replace
-- nnoremap <leader>r :%s///g<left><left>
-- nnoremap <leader>rc :%s///gc<left><left>
 
-- " vim-fugitive - git workflow
-- nmap <leader>gs :G<CR>
-- nmap <leader>gj :diffget //3<CR>
-- nmap <leader>gf :diffget //2<CR>
