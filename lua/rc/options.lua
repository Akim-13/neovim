vim.cmd 'hi colorcolumn ctermbg=0'                  -- Make a colorcolumn less obtrusive
vim.cmd 'hi TSOperator guibg=NONE ctermbg=NONE'
vim.cmd 'hi SpellBad cterm=underline ctermbg=None'  -- Make bad spelling underlined and red

local options = {
--  textwidth = 79,                                 -- Soft wrapping
    number = true,                                  -- Absolute line numbers
    relativenumber = false,                         -- Relative line numbers
    tabstop = 4,                                    -- Width of the TAB character
    shiftwidth = 4,                                 -- Affects auto indentation
    expandtab = true,                               -- Replace TABs with spaces
    autoindent = true,                              -- The simplest type of auto indentation
    smartindent = true,                             -- Indentation but smarter
    colorcolumn = '80',                             -- Show 80 chars limit
    signcolumn = 'yes',                             -- Show errors on the number column
    wrap = false,                                   -- Don't wrap text
    hidden = true,                                  -- Required by some plugins
    splitbelow = true,                              -- Default horizontal split below
    splitright = true,                              -- Default vertical split on the right
    mouse = 'a',                                    -- Enable mouse for all modes
    incsearch = true,                               -- Highlights matching chars as you type
    ignorecase = true,                              -- Ignore case when searching
    smartcase = true,                               -- Don't ignore case when capital letter is entered
    encoding = 'utf-8',                             -- Change encoding to UTF-8
    cursorline = true,                              -- Enable highlighting of the current line
    showcmd = true,                                 -- Show which keys are being pressed
    cmdheight = 0,                                   -- Autohide command line when not in use
    scrolloff = 7,                                  -- Keep the cursor N lines from the top and the bottom of the screen
    sidescroll = 0,                                 -- Keeps the cursor centered when going off the screen
    sidescrolloff = 4,                              -- Number of columns to keep from the edge of the screen
    ruler = true,                                   -- Always show cursor position at the bottom right corner [AIRLINE]
    syntax = 'off',                                 -- Enable syntax highlighting
    showtabline = 2,                                -- Show the tabline at the top
    whichwrap = 'h,l',                              -- Go to the next/previous line after reaching the end/beginning
    termguicolors = true,                           -- More colours
    timeoutlen = 300,                               -- Shorter delay for some of the key combinations
    undofile = true,                                -- Persistent undo history
    undodir = '/home/akim/.cache/nvim/undo'         -- Undo directory
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.opt.clipboard:append('unnamedplus')             -- Link yank buffer with system's clipboard
vim.opt.iskeyword:append('-')                       -- Treat 'example-word' as one word, i.e. `dw` will delete the whole thing
vim.opt.isfname:append('32')                        -- Treat spaces as delimiters. Helps gf to go to a filename containing a space
vim.opt.formatoptions:remove('cro')                 -- Stop newline continuation of comments
vim.opt.fillchars:append('vert:▏')                  -- ▕ right version
vim.cmd 'set t_kb=^?'


-- AUTOCOMMANDS --
-- Change tabs to spaces every time buffer is written
vim.cmd 'autocmd BufWrite * retab'
-- Save markdown file after each change
-- vim.cmd 'autocmd TextChanged,TextChangedI *.md silent write'
-- Enable spell check in markdown and python files
vim.cmd 'autocmd FileType markdown,python set spell'
-- But disable it for TERMINAL mode
vim.cmd 'autocmd TermOpen * setlocal nospell'
-- More Markdown specific settings
vim.cmd 'autocmd FileType markdown set tw=79'

-- Open help either vertically or horizontally depending on the window size
vim.cmd [[
function! s:ShowHelp(tag) abort
    if winheight('%') < winwidth('%')
        execute 'vertical help '.a:tag
    else
        execute 'help '.a:tag
    endif
    execute 'redraw'
endfunction
command! -nargs=1 H call s:ShowHelp(<f-args>)
]]

-- Always open help as a vertical split
-- https://github.com/akim-13/neovim/blob/43632b8f0f801fc382920684c121f5fd43daf5a0/lua/rc/options.lua#L71-L77

-- Disable completion in the command line window
vim.cmd [[
autocmd CmdWinEnter * lua require('cmp').setup({enabled = false})
autocmd CmdWinLeave * lua require('cmp').setup({enabled = true})
]]

-- Make folds persistent (except certain filetypes)
-- vim.cmd [[
-- augroup remember_folds
--     let ftToIgnore = ['python']
--     autocmd!
--     autocmd BufWinLeave * if index(ftToIgnore, &ft) < 0 | mkview 1 
--     autocmd BufWinEnter * if index(ftToIgnore, &ft) < 0 | silent! loadview 1 
-- augroup END
-- ]]

vim.cmd [[
function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
]]


