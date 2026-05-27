return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "vimdoc",
      "javascript",
      "typescript",
      "c",
      "lua",
      "rust",
      "jsdoc",
      "bash",
      "asm",
      "go",
      "python",
    },
    sync_install = false,
    auto_install = true,
    indent = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = { "markdown" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    pcall(vim.treesitter.language.register, "templ", "templ")
  end,
}
