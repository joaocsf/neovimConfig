local ok, blankline = pcall(require, 'indent_blankline')
if ok then
  vim.opt.list = true

  vim.opt.listchars:append 'space:⋅'
  vim.opt.listchars:append 'eol:↴'

  blankline.setup {
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = ' ',
  }
end
