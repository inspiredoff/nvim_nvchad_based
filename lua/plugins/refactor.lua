---@type NvPluginSpec
local spec = {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,

  opts = {
  },


  config = function(_, opts)
    local cmp = require "refactoring"
    cmp.setup(opts)
  end,
}

return spec

