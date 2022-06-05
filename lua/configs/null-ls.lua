local nls = require 'null-ls'
nls.setup {
  sources = {
    nls.builtins.code_actions.proselint,
    nls.builtins.code_actions.shellcheck,
  },
}
