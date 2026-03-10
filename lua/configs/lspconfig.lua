require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      analysis = {
        extraPaths = {
          "./app",
          "~/application/backend_common",
          "/home/inspiredoff/.cache/pypoetry/virtualenvs/tetrika-ZYoIW3hS-py3.13/lib/python3.13/site-packages",
        },
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
        typeCheckingMode = "standard",
        inlayHints = {
          variableTypes = true,
          callArgumentNames = true,
          genericTypes = true,
        },
      },
    },
  },
})
vim.lsp.enable "basedpyright"

vim.lsp.enable "ruff"

vim.lsp.config("mypy", {
  settings = {
    mypy = {
      args = {
        "--follow-imports",
        "skip",
        "--config-file",
        "${mypy_ini_path}",
      },
    },
  },
})
vim.lsp.enable "mypy"

vim.lsp.config("postgres_lsp", {
  cmd = { "postgres-language-server", "lsp-proxy" },
  settings = {
    schema = "https://pg-language-server.com/latest/schema.json",
    db = {
      host = "localhost",
      port = 6432,
      username = "tetrika",
      password = "postgres",
      database = "tetrika",
      connTimeoutSecs = 10,
    },
  },
})

vim.lsp.enable "postgres_lsp"

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if not vim.lsp.config.eslint.on_attach then
      return
    end

    vim.lsp.config.eslint.on_attach(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "LspEslintFixAll",
    })
  end,
})

vim.lsp.enable "eslint"

