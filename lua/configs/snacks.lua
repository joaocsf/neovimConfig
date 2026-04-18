local ok, snacks = pcall(require, 'snacks')


if ok then
  snacks.setup {
    dashboard = { enable = true,
      sections = {
        { height = 9,         indent = 20, padding = 3, section = "terminal", cmd = "cat '" .. vim.fn.stdpath('config') .. '/dashboard/logo.txt' .. "'" },
        { section = "keys",   gap = 1,     padding = 1 },
        { section = "startup" },
      }
    }
  }
end
