require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

vim.lsp.config("basedpyright", {
  settings = {
    basedpyright = {
      -- disableLanguageServices = true,
      analysis = {
        extraPaths = { "./app" },
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

