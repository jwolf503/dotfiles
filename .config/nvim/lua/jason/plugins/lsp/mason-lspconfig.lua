return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- List ONLY real LSP servers
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            completion = { callSnippet = "Replace" },
          },
        },
      },
      pyright = {},
      ts_ls = {},
      jsonls = {},
      yamlls = {},
      html = {},
      cssls = {},
      tailwindcss = {},
      bashls = {},
      dockerls = {},
      gopls = {},
      rust_analyzer = {},
      zls = {},
      hyprls = {},
      hls = {},
      svelte = {
        on_attach = function(client)
          vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = { "*.js", "*.ts" },
            callback = function(ctx)
              client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
            end,
          })
        end,
      },
      graphql = {
        filetypes = {
          "graphql",
          "gql",
          "svelte",
          "typescriptreact",
          "javascriptreact",
        },
      },
      emmet_ls = {
        filetypes = {
          "html",
          "css",
          "scss",
          "sass",
          "less",
          "typescriptreact",
          "javascriptreact",
          "svelte",
        },
      },
    }

    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      vim.lsp.config(name, opts)
    end
  end,
}
