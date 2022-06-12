"===============================================================================
"                                        _         
"                            ____ _   __(_)___ ___ 
"                           / __ \ | / / / __ `__ \
"                          / / / / |/ / / / / / / /
"                         /_/ /_/|___/_/_/ /_/ /_/ 
"                                                  
"===============================================================================
"                               @cfsanderson

source $HOME/.config/nvim/plug-config/coc.vim

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
" NERDTREE
" ------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
" Automatically close a tab if NerdTree is the last thing running
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

call plug#begin('~/.vim/plugged')

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

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
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = 'Firefox Developer Edition'

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
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
"let g:mkdp_theme = 'dark'

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
 
" open FZF
map <leader>f :FZF

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
map <C-L> <C-W><C-L.'>
