local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("caleb.lsp.handlers").on_attach,
    capabilities = require("caleb.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "caleb.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "caleb.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  lspconfig[server].setup(opts)
end

-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end
-- 
-- -- Register a handler that will be called for all installed servers.
-- -- Alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 		on_attach = require("caleb.lsp.handlers").on_attach,
-- 		capabilities = require("caleb.lsp.handlers").capabilities,
-- 	}
-- 
-- 	 if server.name == "jsonls" then
-- 	 	local jsonls_opts = require("caleb.lsp.settings.jsonls")
-- 	 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	 end
-- 
-- 	 if server.name == "sumneko_lua" then
-- 	 	local sumneko_opts = require("caleb.lsp.settings.sumneko_lua")
-- 	 	opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	 end
-- 
-- 	 if server.name == "pyright" then
-- 	 	local pyright_opts = require("caleb.lsp.settings.pyright")
-- 	 	opts = vim.tbl_deep_extend("force", pyright_opts, opts)
-- 	 end
-- 
-- 	-- This setup() function is exactly the same as lspconfig's setup function.
-- 	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
