return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      csharp = { lsp_format = "fallback" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    }
  },
}
