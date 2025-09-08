---@type NvPluginSpec
local specs = {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },

  config = function(_, opts)
    require("todo").setup(opts)
  end,
}

return specs

