local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("caleb.lsp.lsp-installer")
require("caleb.lsp.handlers").setup()
