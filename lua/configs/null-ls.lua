local ok, nls = pcall(require, 'null-ls')

if ok then

  local proselintSettings = {
    filetypes = { 'markdown', 'tex', 'vimwiki' }
  }

  nls.setup {
    fallback_severity = vim.diagnostic.severity.INFO,
    sources = {
      nls.builtins.code_actions.proselint.with(proselintSettings),
      nls.builtins.diagnostics.proselint.with(proselintSettings),
      nls.builtins.code_actions.shellcheck,
      nls.builtins.diagnostics.misspell
    },
  }
end
