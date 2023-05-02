local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
  catppuccin.setup {
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      notify = true,
      harpoon = true,
      sandwich = true
    }
  }
end
