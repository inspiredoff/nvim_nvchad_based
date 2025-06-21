require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 


require("lspconfig").basedpyright.setup {
    on_attach = require("nvchad.configs.lspconfig").on_attach,
    on_init = require("nvchad.configs.lspconfig").on_init,
    capabilities = require("nvchad.configs.lspconfig").capabilities,
    filetypes = {"python"},
    -- root_dir = function (fname)
    --     local root_files = {
    --         'pyproject.toml',
    --         'pyrightconfig.json'
    --     }
    --     return lspconfig.util.root_pattern(table.unpack(root_files))(fname)
    --         or lspconfig.util.find_git_ancestor(fname)
    --         or lspconfig.util.path.dirname(fname)
    -- end,
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
}

require("lspconfig").ruff.setup {
    on_attach = require("nvchad.configs.lspconfig").on_attach,
    on_init = require("nvchad.configs.lspconfig").on_init,
    capabilities = require("nvchad.configs.lspconfig").capabilities,
    settings = {
    }
}

require("lspconfig").mypy.setup {
    on_attach = require("nvchad.configs.lspconfig").on_attach,
    on_init = require("nvchad.configs.lspconfig").on_init,
    capabilities = require("nvchad.configs.lspconfig").capabilities,
    settings = {
    }
}

