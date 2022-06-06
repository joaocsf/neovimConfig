local ok, nls = pcall(require, 'null-ls')
if ok then
  nls.setup {
    sources = {
      nls.builtins.code_actions.proselint,
      nls.builtins.code_actions.shellcheck,
    },
  }
end
