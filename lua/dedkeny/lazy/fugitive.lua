return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git status" })

		local D3dkeny_Fugitive = vim.api.nvim_create_augroup("D3dkeny_Fugitive", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = D3dkeny_Fugitive,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "<leader>gp", function()
					vim.cmd.Git("push")
				end, opts)

				-- rebase always
				vim.keymap.set("n", "<leader>gP", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)

				-- NOTE: It allows me to easily set the branch i am pushing and any tracking
				-- needed if i did not set the branch up correctly
				vim.keymap.set("n", "<leader>go", ":Git push -u origin ", opts)
				vim.keymap.set("n", "<leader>gc", ":Git commit ", opts)
				vim.keymap.set("n", "<leader>ga", ":Git add .", opts)
			end,
		})

		-- diffget - Modify the current buffer to undo difference with another
		vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>", { desc = "diffget //2" })
		vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>", { desc = "diffget //3" })
	end,
}
