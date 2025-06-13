local ok, conform = pcall(require, 'conform')

if ok then
  conform.setup {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      javascript = { "eslint_d", "eslint", stop_after_first = true },
      typescript = { "eslint_d", "eslint", stop_after_first = true },
    }
  }
end
