local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ "saghen/blink.cmp", enabled = false },
		{ import = "lazyvim.plugins.extras.coding.nvim-cmp" },
		require("dedkeny.lazy.agentic"),
		require("dedkeny.lazy.cloak"),
		require("dedkeny.lazy.conform"),
		require("dedkeny.lazy.fugitive"),
		require("dedkeny.lazy.gitsigns"),
		require("dedkeny.lazy.harpoon"),
		require("dedkeny.lazy.lsp"),
		require("dedkeny.lazy.lualine"),
		require("dedkeny.lazy.nvim_cmp"),
		require("dedkeny.lazy.nvim-web-dev-icons"),
		require("dedkeny.lazy.oil"),
		require("dedkeny.lazy.onedark"),
		require("dedkeny.lazy.snacks"),
		require("dedkeny.lazy.telescope"),
		require("dedkeny.lazy.treesitter"),
		require("dedkeny.lazy.trouble"),
		require("dedkeny.lazy.undotree"),
		require("dedkeny.lazy.vimbegood"),
		require("dedkeny.lazy.which-key"),
		"eandrju/cellular-automaton.nvim",
	},
	change_detection = { notify = true },
})
