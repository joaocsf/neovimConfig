local ok, nls = pcall(require, 'null-ls')

if ok then
  nls.setup {
    fallback_severity = vim.diagnostic.severity.INFO,
    sources = {
      nls.builtins.code_actions.proselint,
      nls.builtins.diagnostics.proselint,
      nls.builtins.code_actions.shellcheck,
      nls.builtins.diagnostics.misspell,
      nls.builtins.completion.spell,
    },
  }
end
