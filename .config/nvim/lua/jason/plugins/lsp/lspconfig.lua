return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- Diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      vim.fn.sign_define("DiagnosticSign" .. type, {
        text = icon,
        texthl = "DiagnosticSign" .. type,
      })
    end

    -- LSP keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local map = vim.keymap.set

        map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
        map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
        map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
        map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>d", vim.diagnostic.open_float, opts)
        map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
        map("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
      end,
    })
  end,
}
