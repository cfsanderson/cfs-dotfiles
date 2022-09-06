--------------------------------------------------------------------------------
-- Treesitter (https://github.com/nvim-treesitter/nvim-treesitter)
--------------------------------------------------------------------------------

local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed = "all",       -- A list of parser names (e.g. "c", "lua", etc.), or "all"
  sync_install = false,           -- Install parsers synchronously (only applied to `ensure_installed`) 
  ignore_install = { "" },        -- List of parsers to ignore installing
  highlight = {
    enable = true,                -- false will disable the whole extension
    disable = { "" },             -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = { enable = true, disable = { "yaml" } },
  -- nvim-ts-rainbow - color matches closures https://github.com/p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}
