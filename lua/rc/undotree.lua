local status_ok, undotree = pcall(require, "undotree")
if not status_ok then
    return
end

-- FIXME: the window somethimes opens on the LHS instead of RHS.
vim.g.undotree_WindowLayout = 3
vim.g.undotree_HighlightChangedText = 0
vim.g.undotree_ShortIndicators = 1
vim.g.undotree_SplitWidth = 30
