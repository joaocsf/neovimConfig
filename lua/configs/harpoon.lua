local ok, harpoon = pcall(require, 'harpoon')
if ok then
  harpoon.setup {
    menu = {
      width = vim.api.nvim_win_get_width(0) - 4
    }
  }
end
