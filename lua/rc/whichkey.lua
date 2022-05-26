local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

-- Make the background of popup window invisible
vim.cmd "hi NormalFloat ctermbg=NONE" 

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
            enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
            suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },

    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    key_labels = {
        -- Display control combinations in lowercase
        ["<C-A>"] = "<C-a>",
        ["<C-B>"] = "<C-b>",
        ["<C-C>"] = "<C-c>",
        ["<C-D>"] = "<C-d>",
        ["<C-E>"] = "<C-e>",
        ["<C-F>"] = "<C-f>",
        ["<C-G>"] = "<C-g>",
        ["<C-H>"] = "<C-h>",
        ["<C-I>"] = "<C-i>",
        ["<C-J>"] = "<C-j>",
        ["<C-K>"] = "<C-k>",
        ["<C-L>"] = "<C-l>",
        ["<C-M>"] = "<C-m>",
        ["<C-N>"] = "<C-n>",
        ["<C-O>"] = "<C-o>",
        ["<C-P>"] = "<C-p>",
        ["<C-Q>"] = "<C-q>",
        ["<C-R>"] = "<C-r>",
        ["<C-S>"] = "<C-s>",
        ["<C-T>"] = "<C-t>",
        ["<C-U>"] = "<C-u>",
        ["<C-V>"] = "<C-v>",
        ["<C-W>"] = "<C-w>",
        ["<C-X>"] = "<C-x>",
        ["<C-Y>"] = "<C-y>",
        ["<C-Z>"] = "<C-z>",

        ["'"] = "' or `",
        ['"'] = '" or @',
        ["<c-w>"] = "<C-w>",
        ["<NL>"]  = "<C-j>",

        --["<C->"] = "<C->",
        --[""] = "",
    },

    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "", -- ➜symbol used between a key and it's label
        group = "", -- symbol prepended to a group 
    },

    popup_mappings = {
        scroll_down = "J", -- binding to scroll down inside the popup
        scroll_up = "K", -- binding to scroll up inside the popup
    },

    window = {
        border = "single", -- none, single, double, shadow, rounded
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
    },

    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 4, -- spacing between columns
        align = "center", -- align columns left, center or right
    },

    ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible

    triggers = "auto", -- automatically setup triggers
    --triggers = {"<C-;>", "<leader>"}, -- or specify a list manually

    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
    },
}

-- Horrible (but at least straightforward) solution
-- NORMAL MODE
local nOpts = {
  mode = "n", 
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

-- INSERT MODE
local iOpts = {
  mode = "i",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

-- VISUAL MODE
local vOpts = {
  mode = "v",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

-- VISUAL BLOCK MODE
local xOpts = {
  mode = "x",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

-- TERMINAL MODE
local tOpts = {
  mode = "t",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

-- COMMAND LINE MODE
local cOpts = {
  mode = "c",
  prefix = "",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = true,
}

local iMaps = {
    -- Use hjkl with control
    ["<C-h>"] = { "<C-o>h", ""},
    ["<C-j>"] = { "<C-o>j", ""},
    ["<C-k>"] = { "<C-o>k", ""},
    ["<C-l>"] = { "<C-o>l", ""},
}

local vMaps = {
}

local xMaps = {
    ["\\"] = { "<Plug>(comment_toggle_linewise_visual)", ""},
    ["<C-\\>"] = { "<Plug>(comment_toggle_blockwise_visual)", ""},
}

local tMaps = {
}

local cMaps = {
}

local nMaps = {
    -- INSERT MODE
    -- The reason these mappings aren't in iMaps is that I
    -- can't find a way to triger WhichKey in insert mode.
    ["<LEADER>i"] = { name = " INSERT MODE" },
    ["<LEADER>i<C-t>"] = { "i<C-t>", " Indent right" },
    ["<LEADER>i<C-d>"] = { "i<C-d>", " Indent left" },
    ["<LEADER>i<C-Space>"] = { "i",  " Show this pop-up in INSERT MODE" },

    -- Window commands duplicated from iMaps, so that I could give a description.
    ["<LEADER>i<C-h>"] = { "i<C-o>h", " Move left"},
    ["<LEADER>i<C-j>"] = { "i<C-o>j", " Move down"},
    ["<LEADER>i<C-k>"] = { "i<C-o>k", " Move up"},
    ["<LEADER>i<C-l>"] = { "i<C-o>l", " Move right"},

    -- WhichKey defaults
    ["H"] = "which_key_ignore",     -- Doesn't work until this file is sourced
    ["L"] = "which_key_ignore",     -- Doesn't work until this file is sourced
    ["M"] = "which_key_ignore",     -- Doesn't work until this file is sourced
    ["`"] = "which_key_ignore",
    ["@"] = "which_key_ignore",
    ["'"] = { name = " Marks" },
    ['"'] = { name = " Registers" },
    ["z"] = { name = "ﬡ Folds/View/Spelling" },
    ["g"] = { name = " Miscellaneous" },

    -- Write
    ["<LEADER>w"] =  { name =                 " Write" },
    ["<LEADER>ws"] = { ":w<CR>:source %<CR>", " Write and source" }, -- To save nvim config
    ["<LEADER>wa"] = { ":wa<CR>",             " Write all" },
    ["<LEADER>ww"] = { ":w<CR>",              " Write" },

    -- Exit
    ["Z"] =  { name =" Exit" },
    ["ZZ"] = { ":confirm x<CR>", " Exit current window" },
    ["ZA"] = { ":wqa<CR>",       " Exit all after saving" },
    ["ZQ"] = { "ZQ",             "窱Quit current window without saving" },
    ["ZX"] = { ":conf qall<CR>", " Quit all without saving" },

     -- Debugging
    ["<LEADER>d"] = { name =                                                   " Debug" },
    ["<LEADER>dq"] = { ":call vimspector#Reset()<CR>",                         " Quit" },
    ["<F3>"] = { ":call vimspector#Stop()<CR>",                                "[] ﱢ Stop" },
    ["<F4>"] = { ":call vimspector#Restart()<CR>",                             "[]  Restart" },
    ["<F5>"] = { ":call vimspector#Continue()<CR>",                            "[]  Start/continue" },
    ["<F6>"] = { ":call vimspector#Pause()<CR>",                               "[]  Pause" },
    ["<F8>"] = { ":call vimspector#AddFunctionBreakpoint()<CR>",               "[]  Add function breakpoint" },
    ["<LEADER><F8>"] = { ":call vimspector#RunToCursor()<CR>",                 "[]  Run to cursor" },
    ["<F9>"] = { ":call vimspector#ToggleBreakpoint()<CR>",                    "[] ● Toggle breakpoint" },
    ["<LEADER><F9>"] = { ":call vimspector#ToggleConditionalBreakpoint()<CR>", "[] ◆ Toggle conditional breakpoint" },
    ["<F10>"] = { ":call vimspector#StepOver()<CR>",                           "[]  Step over" },
    ["<F11>"] = { ":call vimspector#StepInto()<CR>",                           "[]  Step into" },
    ["<F12>"] = { ":call vimspector#StepOut()<CR>",                            "[]  Step out" },

    -- Windows
    ["<c-w>"] = { name =                 " Windows" },
    ["<C-h>"] = { "<C-w>h",              "[] ﲑ Focus left" },
    ["<C-j>"] = { "<C-w>j",              "[] ﲐ Focus bottom" },
    ["<C-k>"] = { "<C-w>k",              "[] ﲓ Focus top" },
    ["<C-l>"] = { "<C-w>l",              "[] ﲒ Focus right" },
    ["+"] = { ":resize +2<CR>",          "[]  Increase height" },
    ["_"] = { ":resize -2<CR>",          "[]  Decrease height" },
    ["="] = { ":vertical resize +2<CR>", "[]  Increase width" },
    ["-"] = { ":vertical resize -2<CR>", "[]  Decrease width" },

    -- Buffers
    ["<C-b>"] = { name =                   "ﴵ Buffers" },
    ["<C-b><C-d>"] = { ":w!<CR>:bdel<CR>", " Delete after saving" },
    ["<C-b><C-q>"] = { ":bdel!<CR>",       "﫧Quit without saving" },
    ["<C-n>"] = { ":bnext<CR>",            " Next buffer" },
    ["<C-p>"] = { ":bprevious<CR>",        " Previous buffer" },

    -- Commands
    ["<LEADER>:"] = { name =                                    " Commands" },
    ["<LEADER>:h"] = { ':call <SNR>6_ShowHelp("")<left><left>', " Help", silent = false },
    ["<LEADER>:s"] = { ":%s/",                                  "﯒ Substitute", silent = false },
    ["<LEADER>:S"] = { ":%s/\\<\\><left><left>",                "﯒ Exact substitution", silent = false },
    ["<LEADER>:e"] = { "/\\<\\><left><left>",                   " Exact search", silent = false },

    -- Nvim-tree
    ["<LEADER>e"] = { ":NvimTreeToggle<cr>", "פּ Toggle file explorer" },
    -- From autocmd in keymaps.lua
    ["<LEADER><F5>"] = { "<LEADER><F5>",     " Run code" },
    ["<LEADER>o"] = { "mzo<ESC>`z",          "鱗Insert new line below" },
    ["<LEADER>O"] = { "mzO<ESC>`z",          "麟Insert new line above" },
    ["<LEADER>/"] = { ":set nohlsearch<CR>", " Disable highlight search" },
    ["<LEADER>C"] = { ":mod<CR>",            " Clear command bar" },

    -- Jumps
    ["<C-o>"] = { "<C-o>", " Go back in jump list" },
    ["<C-i>"] = { "<C-j>", " Go forward in jump list" },
    ["<LEADER><C-j>"] = { ":jumps<CR>", " Jump list" },

    -- UndoTree
    ["<LEADER>u"] = { ":UndotreeToggle<CR><C-w>w", "碑Undo history" },

    -- Comments (see comment.lua)
    ["<LEADER>c"] = { nil, " Comment {move}" },
    ["<LEADER>b"] = { nil, " Block Comment {move}" },
    ["<LEADER><C-\\>"] = { nil, " Comment below" },
    ["<LEADER>\\"] = { nil, " Comment above" },
    ["<C-\\>"] = { nil, " Toggle block comment" },
    ["\\"] = { nil, " Toggle comment" },

    --[""] = { "", " " },
    --[""] = { "", " " },
    --[""] = { "", "" },
    --[""] = { "", "" },
    --[""] = { "", "" },
    
    -- More keymaps here:
    -- https://github.com/LunarVim/Neovim-from-scratch/commit/91e22c4076ae58cec23ac5a9b2ea7181dd8f988a
}

which_key.setup(setup)
which_key.register(nMaps, nOpts)
which_key.register(iMaps, iOpts)
which_key.register(xMaps, xOpts)
