local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Modes:
-- normal_mode = "n",
-- insert_mode = "i",
-- visual_mode = "v",
-- visual_block_mode = "x",
-- term_mode = "t",
-- command_mode = "c"


-- NORMAL --
-- Enable highlight search when searching
keymap("n", "/", ":set hlsearch<CR>/", {silent = false, noremap = true})
keymap("n", "?", ":set hlsearch<CR>?", {silent = false, noremap = true})

-- Center the search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Enter command line window
keymap("n", ":", ":<C-f>i", opts)


-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)


-- Python run code
vim.cmd 'autocmd FileType python nnoremap <buffer> <leader><F5> <ESC>:w<CR>:split<CR>:terminal python3.10 "%"<CR>i'
-- C run code
vim.cmd 'autocmd FileType c nnoremap <buffer> <leader><F5> <ESC>:w<CR>:split<CR>:terminal gcc -o cmpd "%" && ./cmpd<CR>i'
-- Markdown
vim.cmd 'autocmd FileType markdown nnoremap <silent> <buffer> gf %:let f=expand("<cfile>")<CR>:exe("e ".f).".md"<CR>'
vim.cmd 'autocmd FileType markdown nnoremap <silent> <buffer> gsf %:let f=expand("<cfile>")<CR>:exe("vs ".f).".md"<CR>'


-- WhichKey
-- All keymaps
keymap("n", "<LEADER><BS>", ":WhichKey<CR>", opts)
-- Insert mode keymaps
keymap("i", "<C-Space>", "<C-o>:WhichKey<CR><leader>i", opts)

-- Pretty folds and indent line
-- Enter insert mode to update disappearing indent lines
keymap("n", "zo", "zoa0<BS><ESC>", opts)
keymap("n", "zO", "zOa0<BS><ESC>", opts)
keymap("n", "zr", "zra0<BS><ESC>", opts)
keymap("n", "zR", "zRa0<BS><ESC>", opts)
