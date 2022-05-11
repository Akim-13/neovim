local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

vim.cmd "hi NormalFloat ctermbg=NONE" -- Make the background of popup window invisible
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
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    ["'"] = "' or `",
    ['"'] = '" or @',
    ["<c-w>"] = "<C-w>",
    ["<C-D>"] = "<C-d>",
    ["<C-Q>"] = "<C-q>",
    ["<C-H>"] = "<C-h>",
    ["<NL>"]  = "<C-j>",
    ["<C-K>"] = "<C-k>",
    ["<C-L>"] = "<C-l>",
    ["<C-N>"] = "<C-n>",
    ["<C-P>"] = "<C-p>",
    --["+"] = "<SHIFT>=",
    --["_"] = "<SHIFT>-",
    --["<C->"] = "<C->",
    --[""] = "",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- ➜symbol used between a key and it's label
    group = "", -- symbol prepended to a group 
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
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
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local optsN = {
  mode = "n", -- NORMAL mode
  prefix = "",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}


local mappingsN = {
    -- WhichKey defaults
    ["H"] = "which_key_ignore",
    ["L"] = "which_key_ignore",
    ["M"] = "which_key_ignore",
    ["`"] = "which_key_ignore",
    ["@"] = "which_key_ignore",
    ["'"] = { name = " Marks" },
    ['"'] = { name = " Registers" },
    ["z"] = { name = "ﬡ Folds/View/Spelling" },
    ["g"] = { name = " Miscellaneous" },

    -- Write
    ["<LEADER>w"] =  { name =                 "   Write" },
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
    ["<LEADER>c"] = { name =                                    " Commands" },
    ["<LEADER>ch"] = { ':call <SNR>6_ShowHelp("")<left><left>', " Help", silent = false },
    ["<LEADER>cs"] = { ":%s/",                                  "﯒ Substitute", silent = false },
    ["<LEADER>cS"] = { ":%s/\\<\\><left><left>",                "﯒ Exact substitution", silent = false },
    ["<LEADER>ce"] = { "/\\<\\><left><left>",                   " Exact search", silent = false },

    -- Nvim-tree
    ["<LEADER>e"] = { ":NvimTreeToggle<cr>", "פּ Toggle file explorer" },
    -- From autocmd in keymaps.lua
    ["<LEADER><F5>"] = { "<LEADER><F5>",     " Run code" },
    ["<LEADER>o"] = { "mzo<ESC>`z",          "鱗Insert new line below" },
    ["<LEADER>O"] = { "mzO<ESC>`z",          "麟Insert new line above" },
    ["<LEADER>/"] = { ":set nohlsearch<CR>", " Disable highlight search" },
    ["<LEADER>C"] = { ":mod<CR>",            " Clear command bar" },

    --[""] = { "", "" },
    --[""] = { "", "" },
    --[""] = { "", "" },
    --[""] = { "", "" },
    --[""] = { "", "" },

    -- More keymaps here:
    -- https://github.com/LunarVim/Neovim-from-scratch/commit/91e22c4076ae58cec23ac5a9b2ea7181dd8f988a
}

which_key.setup(setup)
which_key.register(mappingsN, optsN)
