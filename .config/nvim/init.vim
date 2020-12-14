"===============================================================================
"                 ____                     __                         
"           _____/ __/________ _____  ____/ /__  ______________  ____ 
"          / ___/ /_/ ___/ __ `/ __ \/ __  / _ \/ ___/ ___/ __ \/ __ \
"         / /__/ __(__  ) /_/ / / / / /_/ /  __/ /  (__  ) /_/ / / / /
"         \___/_/ /____/\__,_/_/ /_/\__,_/\___/_/  /____/\____/_/ /_/ 
"                                                                     
"                           _       _ __        _         
"                          (_)___  (_) /__   __(_)___ ___ 
"                         / / __ \/ / __/ | / / / __ `__ \
"                        / / / / / / /_ | |/ / / / / / / /
"                       /_/_/ /_/_/\__/ |___/_/_/ /_/ /_/ 
"===============================================================================

if exists('g:vscode')
    " VSCode extension
else

source $HOME/.config/nvim/plug-config/coc.vim

syntax on

set belloff=all
set display+=lastline
set incsearch
set nocompatible
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

highlight Comment cterm=italic

" NERDTREE
autocmd StdinReadPre * let s:std_in=1
" Open NERDTree by default when vim starts up if no files specified
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Automatically close a tab if NerdTree is the last thing running
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin(stdpath('config') . '/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug '~/.config/nvim/unmanaged-plugins/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

call plug#end()

syntax enable
if has('termguicolors')
  set termguicolors
endif

" Goyo settings
let g:goyo_width = 120
function! s:goyo_enter()
  set wrap
  set linebreak
  set noshowmode
  set noshowcmd
  set scrolloff=999
  execute "MarkdownPreview"
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  set showmode
  set showcmd
  set scrolloff=5
  execute "MarkdownPreviewStop"
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = 'Brave Browser'
let g:mkdp_markdown_css = '~/.config/nvim/darkdown.css'

"" flash yank highlight = great visual feedback
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" Gruvbox Material theme
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_menu_selection_background = 'green'
let g:gruvbox_material_palette = 'material'
let g:gruvbox_material_sign_column_background = 'none'

colorscheme gruvbox-material
set background=dark

" jsx syntax highlighting
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

"FZF settings
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

"" Airline theme
let g:airline_theme = 'gruvbox_material'

" REMAPS
" Leader
let mapleader = "\<Space>"

" set Python Providers
let g:python_host_prog  = '/Users/calebsanderson/.asdf/shims/python2'
let g:python3_host_prog = '/Users/calebsanderson/.asdf/shims/python3'

" make return and shift+return open  up new lines above and below respectively
" without going into insert mode.
" nmap <C-o> O<Esc>
nmap <CR> o<Esc>

" ------------------
" Coc config in ~/.config/nvim/plug-config/
" ------------------
"
" Use <C-l> for trigger snippet expand.
" imap <C-l> <Plug>(coc-snippets-expand)

" let g:UltiSnipsExpandTrigger = '<nop>'

" `gc` comments out a selection

" " Coc-rename
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>

" toggle NERDTree
map <leader>n :NERDTreeToggle<cr>
 
" open FZF
map <leader>f :FZF

" using * to search or visual selection this enters the replace command and
" puts your cursor in line to accept the term to replace
nnoremap <leader>r :%s///g<left><left>
nnoremap <leader>rc :%s///gc<left><left>

" source current file
nnoremap <leader>so :source %<cr>
" save current file
nnoremap <leader>w :w<cr>

" remap normal copy/paste keys to vim registers
vnoremap <C-c> "+y
noremap <C-p> "+p

" vim-fugitive - git workflow
nmap <leader>gs :G<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-U> :nohl<CR><C-U>

" remap change split to just ctrl + {h,j,k,l}
map <C-H> <C-W><C-H>
map <C-J> <C-W><C-J>
map <C-K> <C-W><C-K>
map <C-L> <C-W><C-L>

endif
