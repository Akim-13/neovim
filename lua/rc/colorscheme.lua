require("gruvbox").setup({
    undercurl = true,
    underline = true,
    bold = true,
    italic = true,
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {
        dark0_hard = "#1C1C1C"
    },
    overrides = {
        ColorColumn        = { bg = "#1C1C1C" },
        SignColumn         = { bg = "#1C1C1C" },
        GruvboxAquaSign    = { bg = "#1C1C1C" },
        GruvboxBlueSign    = { bg = "#1C1C1C" },
        GruvboxYellowSign  = { bg = "#1C1C1C" },
        GruvboxRedSign     = { bg = "#1C1C1C" },
        NvimTreeNormal     = { bg = "#151515" },
        NvimTreeRootFolder = { fg = "#358a5b" },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")

-- All higlight commands must be executed after the colorscheme is applied!

-- Make bad spelling underlined and red
vim.cmd 'hi SpellBad cterm=underline ctermbg=None'
-- Make the colorcolumn less obtrusive
vim.cmd 'hi colorcolumn ctermbg=NONE guibg=NONE'
-- Probably a fix for something, don't remember
vim.cmd 'hi TSOperator guibg=NONE ctermbg=NONE'
-- Fix for markdown files
vim.cmd 'hi htmlBold guibg=NONE ctermbg=NONE'
vim.cmd 'hi htmlBoldItalic guibg=NONE ctermbg=NONE'
vim.cmd 'hi htmlBoldUnderline guibg=NONE ctermbg=NONE'
vim.cmd 'hi htmlBoldUnderlineItalic guibg=NONE ctermbg=NONE'
vim.cmd 'hi htmlItalic guibg=NONE ctermbg=NONE'
vim.cmd 'hi htmlUnderline guibg=NONE ctermbg=NONE'
vim.cmd 'hi htmlUnderlineItalic guibg=NONE ctermbg=NONE'
