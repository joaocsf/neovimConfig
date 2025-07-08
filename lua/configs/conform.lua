local ok, conform = pcall(require, 'conform')

if ok then
  local js_defaults = { "prettierd", "eslint_d", stop_after_first = true }

  conform.setup {
    log_level = vim.log.levels.DEBUG,
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = js_defaults,
      typescript = js_defaults,
      typescriptreact = js_defaults,
    },
    formatters = {
      prettierd = { require_cwd = true },
      eslint_d = { require_cwd = true },
    }
  }
end
