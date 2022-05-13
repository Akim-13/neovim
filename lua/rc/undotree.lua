local status_ok, undotree = pcall(require, "undotree")
if not status_ok then
  return
end

vim.g.undotree_WindowLayout = 3
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SplitWidth = 30
vim.g.undotree_HighlightChangedText = 0
