return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"j-hui/fidget.nvim",
	},

	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local has_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

		if has_cmp_lsp then
			capabilities = vim.tbl_deep_extend("force", capabilities, cmp_lsp.default_capabilities())
		else
			vim.schedule(function()
				vim.notify("cmp_nvim_lsp is not installed; LSP completion capabilities were not extended", vim.log.levels.WARN)
			end)
		end

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"bashls",
				"ast_grep",
				"jsonls",
				"rust_analyzer",
				"gopls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				zls = function()
					local lspconfig = require("lspconfig")
					lspconfig.zls.setup({
						capabilities = capabilities,
						root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
						settings = {
							zls = {
								enable_inlay_hints = true,
								enable_snippets = true,
								warn_style = true,
							},
						},
					})
					vim.g.zig_fmt_parse_errors = 0
					vim.g.zig_fmt_autosave = 0
				end,
				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "Lua 5.1" },
								diagnostics = {
									globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
			},
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
