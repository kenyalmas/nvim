return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		config = function()
			require("oil").setup({
				columns = { "icon" },
				keymaps = {},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "<leader>fo", require("oil").toggle_float, { desc = "Oil Explorer floated" })
			vim.keymap.set("n", "<leader>fe", "<CMD>Oil<CR>", { desc = "Oil Explorer windowed" })
		end,
	},
}
