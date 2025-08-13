local ok, catppuccin = pcall(require, 'catppuccin')

if ok then
  ---@diagnostic disable-next-line: missing-fields
  catppuccin.setup {
    auto_integrations = true,
    -- integrations = {
    --   cmp = true,
    --   dap = true,
    --   dap_ui = true,
    --   gitsigns = true,
    --   harpoon = true,
    --   lightspeed = true,
    --   markdown = true,
    --   notify = true,
    --   nvimtree = true,
    --   octo = true,
    --   sandwich = true,
    --   telescope = true,
    --   vimwiki = true,
    --   which_key = true,
    -- }
  }
end
