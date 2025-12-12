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
        require "neotest-python" {
          args = { "-p", "no:warnings", "--log-cli-level=ERROR", "-vv" },
          runner = "pytest",
          -- python = function()
          --   local poetry_utils = require "utils.poetry_python_path"
          --   return poetry_utils.get_poetry_python_path()
          -- end,
        },
      },
    }
  end,
}

return specs

