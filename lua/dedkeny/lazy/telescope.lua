return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({})

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find file" })
		vim.keymap.set("n", "<leader>gl", builtin.git_files, { desc = "Git ls" })
		vim.keymap.set("n", "<leader>fw", function()
			builtin.grep_string({ search = vim.fn.expand("<cword>") })
		end, { desc = "Find word forward" })
		vim.keymap.set("n", "<leader>fW", function()
			builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
		end, { desc = "Find word backwards" })
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "Find string" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help" })
	end,
}
