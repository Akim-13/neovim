--local status_ok, cz = pcall(require, "colorizer")
--if not status_ok then
--  vim.notify("ERROR: something is wrong with autopairs")
--  return
--end
--
--cz.setup()
vim.cmd [[lua require'colorizer'.setup()]]
