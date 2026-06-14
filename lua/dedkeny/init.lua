require("dedkeny.set")
require("dedkeny.remap")
require("dedkeny.lazy_init")
require("dedkeny.options")
require("dedkeny.startup_cwd")

local function ensure_ripgrep_on_windows_path()
	if vim.fn.has("win32") ~= 1 or vim.fn.executable("rg") == 1 then
		return
	end

	local candidates = {
		vim.fn.expand("$LOCALAPPDATA/OpenAI/Codex/bin/*/rg.exe"),
		vim.fn.expand("$LOCALAPPDATA/Packages/OpenAI.Codex_2p2nqsd0c76g0/LocalCache/Local/OpenAI/Codex/bin/rg.exe"),
		vim.fn.expand("$LOCALAPPDATA/Programs/Microsoft VS Code/*/resources/app/node_modules/@vscode/ripgrep-universal/bin/win32-x64/rg.exe"),
		vim.fn.expand("$USERPROFILE/scoop/apps/ripgrep/current/rg.exe"),
	}

	for _, pattern in ipairs(candidates) do
		local matches = vim.fn.glob(pattern, false, true)
		if #matches > 0 then
			local dir = vim.fs.dirname(matches[1])
			if dir and dir ~= "" then
				vim.env.PATH = dir .. ";" .. vim.env.PATH
				return
			end
		end
	end
end

ensure_ripgrep_on_windows_path()

local augroup = vim.api.nvim_create_augroup
local DedkenyGroup = augroup("Dedkeny", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

vim.api.nvim_create_autocmd("TextYankPost", {
	group = yank_group,
	pattern = "*",
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

autocmd({ "BufWritePre" }, {
	group = DedkenyGroup,
	pattern = "*",
	command = [[%s/\s\+$//e]],
})

------- LSP configuration ------------------------------

vim.keymap.set("n", "<leader>lR", "<cmd>LspRestart<cr>")

autocmd("LspAttach", {
	group = DedkenyGroup,
	callback = function(e)
		local opts = { buffer = e.buf }
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "<leader>ls", function()
			vim.lsp.buf.workspace_symbol()
		end, opts)
		vim.keymap.set("n", "<leader>ld", function()
			vim.diagnostic.open_float()
		end, opts)
		vim.keymap.set("n", "<leader>la", function()
			vim.lsp.buf.code_action()
		end, opts)
		vim.keymap.set("n", "<leader>lr", function()
			vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "<leader>ln", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end, opts)
	end,
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
pcall(function()
	vim.o.winborder = "rounded"
end)

vim.api.nvim_create_user_command("LazyMessages", function()
	vim.cmd("messages")
end, { desc = "Show startup and plugin messages" })

vim.api.nvim_create_user_command("LazyLogFile", function()
	vim.cmd("edit " .. vim.fn.stdpath("state") .. "/lazy/log.json")
end, { desc = "Open lazy.nvim log file" })

vim.keymap.set("n", "<leader>ed", vim.diagnostic.open_float, { desc = "Line diagnostics" })
vim.keymap.set("n", "<leader>eq", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
vim.keymap.set("n", "<leader>em", "<cmd>LazyMessages<cr>", { desc = "Show messages" })
vim.keymap.set("n", "<leader>el", "<cmd>Lazy log<cr>", { desc = "Show Lazy log" })
vim.keymap.set("n", "<leader>en", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>ep", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
