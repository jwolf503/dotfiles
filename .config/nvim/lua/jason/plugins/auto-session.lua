return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
		auto_restore = false,
		auto_session_suppress_dirs = {
			"~/",
			"~/Dev/",
			"~/Downloads",
			"~/Documents",
			"~/Desktop",
		},
	})

    local keymap = vim.keymap

    keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" }) -- restore session
    keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto-session root dir" }) -- save se
end
}
