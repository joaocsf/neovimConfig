local ok, conform = pcall(require, 'conform')

if ok then
  conform.setup {
    default_format_opts = {
      lsp_format = "fallback",
    }
  }
end
