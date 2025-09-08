---@type NvPluginSpec
local spec = {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "sql",
      "python",
    },
    indent = { enable = true },
    highlight = { enable = true },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<leader>is",
        node_incremental = "<Tab>",
        scope_incremental = "<S-s>",
        node_decremental = "<S-Tab>",
      },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
return spec
