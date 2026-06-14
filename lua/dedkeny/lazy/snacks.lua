return {
	"folke/snacks.nvim",
	priority = 900,
	lazy = false,
	opts = {
		explorer = { enabled = true },
		picker = { enabled = true },
		terminal = { enabled = true },
		zen = { enabled = true },
		lazygit = { enabled = true },
	},
	keys = {
		{
			"<leader>fe",
			function()
				require("snacks").explorer()
			end,
			desc = "File explorer",
		},
		{
			"<leader>fF",
			function()
				require("snacks").picker.files()
			end,
			desc = "Snacks files",
		},
		{
			"<leader>fg",
			function()
				require("snacks").picker.grep()
			end,
			desc = "Snacks grep",
		},
		{
			"<leader>mt",
			function()
				require("snacks").terminal()
			end,
			desc = "Terminal",
		},
		{
			"<leader>mz",
			function()
				require("snacks").zen.zoom()
			end,
			desc = "Zen zoom",
		},
		{
			"<leader>gg",
			function()
				require("snacks").lazygit()
			end,
			desc = "Lazygit",
		},
	},
}
