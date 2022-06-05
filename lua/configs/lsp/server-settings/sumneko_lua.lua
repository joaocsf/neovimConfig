return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.stdpath 'config' .. '/lua'] = true,
        },
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
    },
  },
}
