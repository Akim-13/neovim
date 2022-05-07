vim.cmd 'hi colorcolumn ctermbg=0'					-- Make a colorcolumn less obtrusive
vim.cmd "hi TSOperator guibg=NONE ctermbg=NONE"
vim.cmd 'hi SpellBad cterm=underline ctermbg=None'	-- Make bad spelling underlined and red
local options = {
	number = true,									-- Absolute line numbers
	relativenumber = true,							-- Relative line numbers
	tabstop = 4,									-- Width of the TAB character
	softtabstop = 4,								-- Affects a manual indentation
	shiftwidth = 4,								    -- Affects an auto indentation
	autoindent = true,								-- The simplest type of auto indentation
	smartindent = true,								-- Indentation but smarter
	colorcolumn = '80',								-- Show 80 chars limit
	signcolumn = 'yes',								-- Show errors on the number column
	wrap = false,									-- Don't wrap text
	hidden = true,									-- Required by some plugins
	splitbelow = true,								-- Default horizontal split below
	splitright = true,				    		    -- Default vertical split on the right
	mouse = 'a',									-- Enable mouse for all modes
	incsearch = true,								-- Highlights matching chars as you type
	ignorecase = true,								-- Ignore case when searching
	smartcase = true,								-- Don't ignore case when capital letter is entered
	encoding = 'utf-8',								-- Change encoding to UTF-8
	cursorline = true,								-- Enable highlighting of the current line
	showcmd = true,									-- Show which keys are being pressed
	scrolloff = 7,									-- Keep the cursor N lines from the top and the bottom of the screen
	ruler = true,									-- Always show cursor position at the bottom right corner [AIRLINE]
	textwidth = 79,								    -- Soft wrapping
	syntax = 'off',									-- Enable syntax highlighting
	showtabline = 2,								-- Show the tabline at the top
	whichwrap = 'h,l',								-- Go to the next/previous line after reaching the end/beginning
	termguicolors = true,
	--timeoutlen = 200								-- Shorter delay for some of the key comninations
}
for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.clipboard:append('unnamedplus')				-- Link yank buffer with system's clipboard
vim.opt.iskeyword:append('-')						-- Treat 'example-word' as one word, i.e. `dw` will delete the whole thing
vim.opt.isfname:append('32')						-- Treat spaces as delimeters. Helps gf to go to a filename containing a space
vim.opt.formatoptions:remove('cro')				    -- Stop newline continuation of comments

vim.cmd 'set t_kb=^?'
--vim.cmd 'set t_Co=256'
--vim.cmd 'filetype plugin indent on'

-- Save the file after each change
vim.cmd 'autocmd TextChanged,TextChangedI *.md silent write'
-- Enable spell check in markdown files
vim.cmd 'autocmd FileType markdown set spell'
