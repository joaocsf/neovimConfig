local ok, cmp = pcall(require, 'blink.cmp')

if ok then
  cmp.setup {
    keymap = { preset = 'default' },
    appearance = {
      nerd_font_variant = 'mono'
    },
    completion = {
      documentation = { auto_show = true },
      accept = { auto_brackets = { enabled = true } },
      menu = { auto_show = true }
    },
    cmdline = {
      completion = { menu = { auto_show = true } }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true }
  }
end
