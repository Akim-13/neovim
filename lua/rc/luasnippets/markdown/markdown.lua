-- Huge shout out to Elijan J. Mastnak for making such a great luasnip guide:
-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/

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

return {
    s({ name = "Inline Maths", trig = "mm", snippetType = "autosnippet" },
        fmta(
            "<>$<>$",
            {
                -- Function node just inserts regex capture groups from
                -- snippet’s trigger back into the snippet body.
                f( function(_, snip) return snip.captures[1] end ),
                -- Allows to implement visual selection.
                -- :help luasnip-dynamicnode
                d(1, get_visual)
            }
        )
    ),

    s({ name = "Display Maths", trig = "dm", snippetType = "autosnippet" },
        fmta(
            "<>$$ <> $$ <>",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual),
                i(0)
            }
        )
    ),

    s({ name = "Align Math", trig = "alm", snippetType = "autosnippet" },
        fmta([[
            <>
            $$
            \begin{align}
                <>
            \end{align}
            $$
            <>
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual),
                i(0)
            }
        )
    ),

    s({ name = "Cases Math", trig = "csm", snippetType = "autosnippet" },
        fmta([[
            <>
            $$
            \begin{cases}
                <>
            \end{cases}
            $$
            <>
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual),
                i(0)
            }
        )
    ),

    s({ name = "Align Math", trig = "alim", snippetType = "autosnippet" },
        fmta([[
            <>
            $$
            \begin{align}
                <>
            \end{align}
            $$
            <>
            ]],
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual),
                i(0)
            }
        )
    ),

    s({ name = "Q&A", trig = "qa", snippetType="autosnippet" },
        fmta([[
                **Q<>:** <>
                **A:** <>

                *Answer:*
            ]],
            {
                i(1),
                d(2, get_visual),
                i(3),
            }
        )
    ),

    s({ name = "File Link", trig = "fll", snippetType="autosnippet" },
        fmta(
            "[[./<>|<>]]",
            {
                i(1),
                d(2, get_visual)
            }
        )
    ),
}
