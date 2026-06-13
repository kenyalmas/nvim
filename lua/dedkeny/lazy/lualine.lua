return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      disabled_filetypes = {
        statusline = { "AgenticChat", "AgenticInput", "AgenticCode", "AgenticFiles", "AgenticDiagnostics" },
        winbar = { "AgenticChat", "AgenticInput", "AgenticCode", "AgenticFiles", "AgenticDiagnostics" },
      },
    },
  },
}
