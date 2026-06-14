return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	opts = {
		install_dir = vim.fn.stdpath("data") .. "/site",
		highlight = { enable = true },
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)

		pcall(vim.treesitter.language.register, "templ", "templ")
	end,
}
