local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	vim.notify("ERROR: something is wrong with lspconfig")
	return
end

require("rc.lsp.lsp-installer")
require("rc.lsp.handlers").setup()
