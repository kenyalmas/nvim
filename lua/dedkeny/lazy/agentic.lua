local function codex_acp_command()
	local candidates

	if vim.fn.has("win32") == 1 then
		candidates = { "codex-acp.cmd", "codex-acp" }
	else
		candidates = { "codex-acp", "codex-acp.cmd" }
	end

	for _, candidate in ipairs(candidates) do
		local exe = vim.fn.exepath(candidate)
		if exe ~= "" then
			return exe
		end
	end

	if vim.fn.has("win32") == 1 then
		local appdata = vim.fn.getenv("APPDATA")
		if appdata ~= vim.NIL and appdata ~= "" then
			return appdata .. "/npm/codex-acp.cmd"
		end
	end

	return candidates[1]
end

local function codex_acp_provider()
	local command = codex_acp_command()

	if vim.fn.has("win32") == 1 then
		return {
			command = "cmd.exe",
			args = { "/c", command },
		}
	end

	return {
		command = command,
		args = {},
	}
end

return {
	"carlos-algms/agentic.nvim",
	lazy = false,
	priority = 950,
	opts = {
		provider = "codex-acp",
		acp_providers = {
			["codex-acp"] = codex_acp_provider(),
		},
		windows = {
			position = "right",
			width = "40%",
			height = "30%",
		},
	},
	keys = {
		{
			"<leader>aa",
			function()
				require("agentic").toggle()
			end,
			mode = { "n", "v", "i" },
			desc = "Toggle AI chat",
		},
		{
			"<leader>ac",
			function()
				require("agentic").add_selection_or_file_to_context()
			end,
			mode = { "n", "v" },
			desc = "Add file or selection to AI context",
		},
		{
			"<leader>an",
			function()
				require("agentic").new_session()
			end,
			mode = { "n", "v", "i" },
			desc = "New AI session",
		},
		{
			"<leader>ar",
			function()
				require("agentic").restore_session()
			end,
			mode = { "n", "v", "i" },
			desc = "Restore AI session",
		},
		{
			"<leader>ad",
			function()
				require("agentic").add_current_line_diagnostics()
			end,
			mode = { "n" },
			desc = "Add line diagnostics to AI",
		},
		{
			"<leader>aD",
			function()
				require("agentic").add_buffer_diagnostics()
			end,
			mode = { "n" },
			desc = "Add buffer diagnostics to AI",
		},
		{
			"<leader>al",
			function()
				require("agentic").rotate_layout({ "right", "bottom", "left" })
			end,
			mode = { "n", "v", "i" },
			desc = "Rotate AI layout",
		},
	},
}
