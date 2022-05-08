local colorscheme = "gruvbox"

vim.cmd "let g:gruvbox_contrast_dark='hard'"
vim.cmd "let g:gruvbox_sign_column='bg0'"
vim.cmd "let g:gruvbox_color_column='bg0'"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("ERROR: colorscheme " .. colorscheme .. " not found")
  return
end



-- This colorscheme is an utter mess, half of the options work randomly in
-- random places. I got no clue what to do about it.

--vim.o.background = "dark"
-- vim.cmd "hi TSOperator guibg=NONE ctermbg=NONE"
--vim.cmd "let g:gruvbox_bold='0'"
--vim.cmd "let g:gruvbox_italic='1'"
--vim.cmd "let g:gruvbox_italicize_comments='1'"
--vim.cmd "let g:gruvbox_invert_selection='0'"
--vim.cmd "let g:gruvbox_background='dark'"
--vim.cmd 'hi Normal ctermbg=234 guibg=#1d2021'			-- Make the background transparent (for a translucent terminal)
--vim.cmd 'hi colorcolumn ctermbg=NONE'					-- Make a colorcolumn less obtrusive
--vim.cmd 'hi SpellBad cterm=underline ctermbg=None'	-- Make bad spelling underlined
--vim.cmd 'hi TSOperator guibg=NONE ctermbg=NONE'
--vim.cmd "let g:gruvbox_invert_selection='0'"
--vim.cmd "let g:gruvbox_contrast_dark='hard'"
--vim.cmd "let g:gruvbox_italic='1'"
--vim.cmd "let g:gruvbox_bold='0'"
--vim.cmd "let g:gruvbox_italicize_comments='1'"
--vim.cmd "let g:gruvbox_sign_column='bg0'"
--vim.cmd "let g:gruvbox_color_column='bg0'"
