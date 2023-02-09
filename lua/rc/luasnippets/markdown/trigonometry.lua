-- These are the default luasnip abbreviations. I explicitly
-- declare them just for the sake of complaining LSP.
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local get_visual = function(args, parent)
    if (#parent.snippet.env.SELECT_RAW > 0) then
        return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
    else
        return sn(nil, i(1, ''))
    end
end

local mathzone = require "rc/luasnippets/markdown/detect-mathzone"
local in_mathzone = mathzone.in_mathzone

return {
    s({ name = "sin", trig = "sin", snippetType="autosnippet" },
        fmta(
            "\\sin{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "cos", trig = "cos", snippetType="autosnippet" },
        fmta(
            "\\cos{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "tan", trig = "tan", snippetType="autosnippet" },
        fmta(
            "\\tan{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "cosec", trig = "csc", snippetType="autosnippet" },
        fmta(
            "\\csc{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "sec", trig = "sec", snippetType="autosnippet" },
        fmta(
            "\\sec{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "cot", trig = "cot", snippetType="autosnippet" },
        fmta(
            "\\cot{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "arcsin", trig = "asin", snippetType="autosnippet" },
        fmta(
            "\\arcsin{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "arccos", trig = "acos", snippetType="autosnippet" },
        fmta(
            "\\arccos{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "arctan", trig = "atan", snippetType="autosnippet" },
        fmta(
            "\\arctan{<>}",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),
}
