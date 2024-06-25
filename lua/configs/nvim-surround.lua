local ok, surround = pcall(require, 'nvim-surround')

if ok then
  surround.setup {
    surrounds = {
      ["<cr>"] = {
        add = { { "", "" }, { "", "" } }
      }
    }
  }
end
