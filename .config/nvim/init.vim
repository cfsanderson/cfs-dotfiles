"===============================================================================
"                 ____                     __                         
"           _____/ __/________ _____  ____/ /__  ______________  ____ 
"          / ___/ /_/ ___/ __ `/ __ \/ __  / _ \/ ___/ ___/ __ \/ __ \
"         / /__/ __(__  ) /_/ / / / / /_/ /  __/ /  (__  ) /_/ / / / /
"         \___/_/ /____/\__,_/_/ /_/\__,_/\___/_/  /____/\____/_/ /_/ 
"                                                                     
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
  "execute "MarkdownPreview"
endfunction

function! s:goyo_leave()
  set nowrap
  set nolinebreak
  set showmode
  set showcmd
  set scrolloff=5
  "execute "MarkdownPreviewStop"
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"" Markdown Preview
"let g:mkdp_auto_start = 0
"let g:mkdp_refresh_slow = 0
"let g:mkdp_browser = ''
"let g:mkdp_markdown_css = '~/.config/nvim/darkdown.css'
"
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
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
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

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
