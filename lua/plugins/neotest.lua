---@type NvPluginSpec
local specs = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  opts = {
    adapters = {},
  },

  config = function(_, _)
    require("neotest").setup {
      adapters = {
        require "neotest-python" {},
      },
    }
  end,
}

return specs

