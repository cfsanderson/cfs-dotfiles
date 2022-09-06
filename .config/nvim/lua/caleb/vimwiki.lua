vim.api.nvim_set_var('vimwiki_global_ext', 0)

vim.cmd([[
  set nocompatible
  filetype plugin on
  let g:vimwiki_list = [{'path': '$HOME/Projects/.wiki/', 'syntax': 'markdown', 'ext': '.md', 'links_space_char': '_'}]
  let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
  " let g:taskwiki_markup_syntax = 'markdown'
  let g:markdown_folding = 1
  let g:vimwiki_markdown_link_ext = 1
  let g:vimwiki_auto_header = 1
]])
