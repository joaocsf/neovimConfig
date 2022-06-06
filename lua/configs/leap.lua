local ok, leap = pcall(require, 'leap')
if ok then
  leap.setup {
    case_insensitive = true
  }

  leap.set_default_keymaps()
end
