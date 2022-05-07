local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
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
-- Save a file
keymap("n", "<leader>ww", ":w<CR>", opts)
-- Save and source a current file (to apply changes in vimrc)
keymap("n", "<leader>ws", ":w<CR>:source %<CR>", opts)

-- Insert a new line below/above the cursor
keymap("n", "<leader>o", "mzo<ESC>`z", opts)
keymap("n", "<leader>O", "mzO<ESC>`z", opts)

-- Enable highlight search when searching
keymap("n", "/", ":set hlsearch<CR>/", {noremap = true})
keymap("n", "?", ":set hlsearch<CR>?", {noremap = true})
-- Disable highlight search
keymap("n", "<leader>/", ":set nohlsearch<CR>", opts)
-- Center the search results
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize splits
keymap("n", "+", ":resize +2<CR>", opts)
keymap("n", "_", ":resize -2<CR>", opts)
keymap("n", "=", ":vertical resize +2<CR>", opts)
keymap("n", "-", ":vertical resize -2<CR>", opts)

-- File explorer
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Navigate buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-p>", ":bprevious<CR>", opts)
keymap("n", "<C-b><C-d>", ":bdel<CR>", opts)
keymap("n", "<C-b><C-s>", ":unh<CR>", opts)  -- Unhide all buffers (s for show)


-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)


-- Python
vim.cmd 'autocmd FileType python nnoremap <buffer> <F5> <ESC>:w<CR>:split<CR>:terminal python3.10 "%"<CR>i'
-- C
vim.cmd 'autocmd FileType c nnoremap <buffer> <F5> <ESC>:w<CR>:split<CR>:terminal gcc -o cmpd "%" && ./cmpd<CR>i'
-- Markdown
vim.cmd 'autocmd FileType markdown nnoremap <silent> <buffer> gf %:let f=expand("<cfile>")<CR>:exe("e ".f).".md"<CR>'
vim.cmd 'autocmd FileType markdown nnoremap <silent> <buffer> gsf %:let f=expand("<cfile>")<CR>:exe("vs ".f).".md"<CR>'


-- PLUGINS
-- TODO: make more keybindings and see what telescope can do.
-- Telescope
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
--keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = 10 }))<cr>", opts)
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
