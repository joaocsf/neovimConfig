return {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      format = {
        enable = true,
        defaultConfig = {
          tab_width = '2',
          ident_size = '2',
          insert_style = 'space',
          quote_style = 'single',
          call_arg_parentheses = 'remove',
          align_chained_expression_statement = 'true',
          align_table_field_to_first_field = 'false',
        }
      },
      telemetry = { enable = false }
    },
  },
}
