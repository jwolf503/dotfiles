return {
	"williamboman/mason.nvim",
	build = ":MasonUpdate",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "",
					package_pending = "",
					package_uninstalled = "",
				},
			},
		})

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"ts_ls",
				"jsonls",
				"yamlls",
				"html",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"svelte",
				"graphql",
				"bashls",
				"dockerls",
				"vimls",
				"gopls",
				"rust_analyzer",
				"zls",
				"hyprls",
				"hls",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				--       "stylua",
				"prettier",
				"eslint_d",
				"black",
				"isort",
				"pylint",
			},
		})
	end,
}
