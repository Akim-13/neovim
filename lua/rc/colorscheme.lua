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
        ColorColumn       = { bg = "#1C1C1C" },
        SignColumn        = { bg = "#1C1C1C" },
        GruvboxAquaSign   = { bg = "#1C1C1C" },
        GruvboxBlueSign  = { bg = "#1C1C1C" },
        GruvboxYellowSign = { bg = "#1C1C1C" },
        GruvboxRedSign    = { bg = "#1C1C1C" },
        NvimTreeNormal = { bg = "#151515" },
        -- NvimTreeWinSeparator = { bg = "#1c1c1c" },

        -- NvimTreeEndOfBuffer = { bg = "#FF0000", fg = "#FF0000" },
        -- NvimTreeNormalNC = { bg = "#FF0000", fg = "#FF0000" },
        -- NvimTreeWinIndentMarker = { bg = "#FF0000",  fg = "#FF0000" },

        NvimTreeRootFolder = { fg = "#358a5b" },
    },
    dim_inactive = false,
    transparent_mode = false,
})

vim.cmd("colorscheme gruvbox")
