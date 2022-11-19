local ok, ts_context = pcall(require, 'treesitter-context')

if ok then

  ts_context.setup {
    enable = true,
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer',
    patterns = {
      hocon = {
        'pair'
      },
      scala = {
        'infix_expression',
        'object_definition',
        'call_expression'
      }
    }
  }

end
