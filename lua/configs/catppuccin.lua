local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
  catppuccin.setup {
    integrations = {
      cmp = true,
      dap = true,
      dap_ui = true,
      gitsigns = true,
      harpoon = true,
      lightspeed = true,
      markdown = true,
      notify = true,
      nvimtree = true,
      octo = true,
      sandwich = true,
      telescope = true,
      vimwiki = true,
      which_key = true,
    }
  }
end
