"===============================================================================
"                                        _         
"                            ____ _   __(_)___ ___ 
"                           / __ \ | / / / __ `__ \
"                          / / / / |/ / / / / / / /
"                         /_/ /_/|___/_/_/ /_/ /_/ 
"                                                  
"===============================================================================
"                               @cfsanderson

syntax on

set belloff=all
set display+=lastline
set incsearch
set noerrorbells
set noswapfile
set nowrap
set number relativenumber
set scrolloff=5
set sidescrolloff=5
set shiftwidth=2
set smartindent
set smartcase
set splitbelow
set splitright
set tabstop=2 softtabstop=2 expandtab
set undodir=~/.vim/undodir

" for VimWiki
set nocompatible
filetype plugin on

highlight Comment cterm=italic

" ------------------------------------------------------------------------------ 
"  NERDTREE
" ------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
" Automatically close a tab if NerdTree is the last thing running
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin('~/.vim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -s. -bbuild -dcmake_build_type=release && cmake --build build --config release && cmake --install build --prefix build' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug '~/.config/nvim/unmanaged-plugins/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug '~/.config/nvim/unmanaged-plugins/vim-css-color'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

call plug#end()

syntax enable
if has('termguicolors')
  set termguicolors
endif

" ------------------------------------------------------------------------------
" PYTHON
" ------------------------------------------------------------------------------
"let g:python2_host_prog = '/Users/caleb/.asdf/shims/python2'
let g:python3_host_prog = '/opt/homebrew/bin/python3'

" ------------------------------------------------------------------------------
" MARKDOWN PREVIEW
" ------------------------------------------------------------------------------
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_refresh_slow = 1
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'Firefox Developer Edition'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']

" ------------------------------------------------------------------------------
" Goyo settings
" ------------------------------------------------------------------------------
let g:goyo_width = 120
function! s:goyo_enter()
  set wrap
  set linebreak
  set noshowmode
  set noshowcmd
  set scrolloff=999
  set number relativenumber
  MarkdownPreviewToggle
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  set showmode
  set showcmd
  set scrolloff=5
  MarkdownPreviewToggle
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ------------------------------------------------------------------------------
" VimWiki
" ------------------------------------------------------------------------------
" set vimwiki location, syntax type, file extension, and file naming convention
let g:vimwiki_list = [{'path': '$HOME/Projects/.wiki/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:taskwiki_markup_syntax = 'markdown'
let g:markdown_folding = 1

" makes vimwiki links as [text](text.md) instead of [text](text)
let g:vimwiki_markdown_link_ext = 1

" auto add headers to new pages and diary entries
let g:vimwiki_auto_header = 1

" ------------------------------------------------------------------------------
" Gruvbox Material theme
" ------------------------------------------------------------------------------
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_menu_selection_background = 'green'
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_sign_column_background = 'none'

colorscheme gruvbox-material
set background=dark

"" Airline theme
let g:airline_theme = 'gruvbox_material'

" ------------------------------------------------------------------------------
" SYNTAX HIGHLIGHTING
" ------------------------------------------------------------------------------
" jsx syntax highlighting dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" jsx syntax highlighting orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" jsx syntax highlighting yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" ------------------------------------------------------------------------------
" MISCELLANEOUS
" ------------------------------------------------------------------------------

" shut off Perl
let g:loaded_perl_provider = 0

"" flash yank highlight = great visual feedback
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

"FZF settings
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" ------------------------------------------------------------------------------
" REMAPS & KEYBINDINGS
" ------------------------------------------------------------------------------

" Leader
let mapleader = "\<Space>"

" Coc-rename
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" toggle NERDTree
map <leader>n :NERDTreeToggle<cr>

" trying to resize splits with control + arrows
"nnoremap <C-Up> :resize -2<cr>
"nnoremap <C-Down> :resize 2<cr>
"nnoremap <C-Left> :vertical resize -2<cr>
"nnoremap <C-Right> :vertical resize 2<cr>

" open FZF
"map <leader>f :FZF

" using * to search or visual selection this enters the replace command and
" puts your cursor in line to accept the term to replace
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left>

" source current file
nnoremap <leader>so :source %<cr>

" remap normal copy/paste keys to vim registers
vnoremap <C-c> "+y
noremap <C-p> "+p

" vim-fugitive - git workflow
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" use F1 to toggle search highlight
nnoremap <F1> :set hlsearch!<CR>

" use F2 to insert current date in 'Day DD Mon YYYY' format
nmap <F2> i<C-R>=strftime("%a %d %b %Y")<CR><Esc>
imap <F2> <C-R>=strftime("%a %d %b %Y")<CR>

" use F3 to insert current time
nmap <F3> i<C-R>=strftime("%H:%M:%S")<CR><Esc>
imap <F3> <C-R>=strftime("%H:%M:%S")<CR>

" remap change split to just ctrl + {h,j,k,l}
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>

"lua require('basic')
