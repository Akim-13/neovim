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
    s({ name = "Fraction", trig = "ff", snippetType="autosnippet" },
        fmta(
            "\\frac{<>}{<>}",
            {
                d(1, get_visual),
                i(2),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Superscript", trig = "([%w%)%]%}])'", wordTrig=false, regTrig = true, snippetType="autosnippet" },
        fmta(
            "<>^{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Prime", trig = "`", wordTrig = false, snippetType="autosnippet" },
        { t("'") },
        { condition = in_mathzone }
    ),

    s({ name = "Indefinite Integral", trig = "inti", snippetType="autosnippet" },
        fmta(
            "\\int <> \\,\\mathrm{d}<>",
            {
                d(1, get_visual),
                i(2, "x"),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Definite Integral", trig = "intd", snippetType="autosnippet" },
        fmta(
            "\\int_{<>}^{<>} <> \\,\\mathrm{d}<>",
            {
                i(1),
                i(2),
                d(3, get_visual),
                i(4, "x"),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Derivative", trig = "dd", wordTrig = false, snippetType="autosnippet" },
        fmta(
            "\\frac{\\mathrm{d}<>}{\\mathrm{d}<>}",
            {
                i(1),
                i(2)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Derivative d/dx", trig = "dx", wordTrig = false, snippetType="autosnippet" },
        fmta(
            "\\frac{\\mathrm{d}}{\\mathrm{d}x} \\left( <> \\right)",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Derivative dy/dx", trig = "dy", wordTrig = false, snippetType="autosnippet" },
        fmta(
            "\\frac{\\mathrm{d}<>y}{\\mathrm{d}x<>}",
            {
                i(1),
                i(2)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Multiply Both Sides by", trig = "mbs", snippetType="autosnippet" },
        fmta(
            "\\quad \\biggr| \\times <>",
            {
                d(1, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Boxed", trig = "box", snippetType="autosnippet" },
        fmta(
            "\\boxed{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Natural Logarithm", trig = "ln", wordTrig = false, snippetType="autosnippet" },
        fmta(
            "\\ln{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Infinity", trig = "inf", snippetType="autosnippet" },
        { t("\\infty") },
        { condition = in_mathzone }
    ),

    s({ name = "Limit", trig = "lim", snippetType="autosnippet" },
        fmta(
            "\\lim_{<> \\to <>} <>",
            {
                i(1, "x"),
                i(2),
                d(3, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Implies", trig = "imp", snippetType="autosnippet" },
        { t("\\implies") },
        { condition = in_mathzone }
    ),

    s({ name = "Annotated Implies", trig = "aimp", snippetType="autosnippet" },
        fmta(
            "\\xRightarrow[<>]{<>}",
            {
                i(1),
                d(2, get_visual),
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Text", trig = "tek", snippetType="autosnippet" },
        fmta(
            "\\text{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Annotated Equals Sign", trig = "aeq", snippetType="autosnippet" },
        fmta(
            "\\overset{<>}{=}",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "In Set", trig = "inset", snippetType="autosnippet" },
        fmta(
            "\\in \\mathbb{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Where", trig = "(, )whr", wordTrig=false, regTrig = true, snippetType="autosnippet" },
        fmta(
            "<>\\text{ where } <>",
            {
                f( function(_, snip) return snip.captures[1] end ),
                i(0)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Tilde", trig = "~", wordTrig = false, snippetType="autosnippet" },
        fmta(
            "\\tilde <>",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Hat", trig = "hat", wordTrig = false, snippetType="autosnippet" },
        fmta(
            "\\hat <>",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Bar", trig = "bar", swordTrig = false, nippetType="autosnippet" },
        fmta(
            "\\bar <>",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

    s({ name = "Tag", trig = "tg", snippetType="autosnippet" },
        fmta(
            "\\tag{<>}",
            {
                d(1, get_visual)
            }
        ),
        { condition = in_mathzone }
    ),

}


