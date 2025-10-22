---@type NvPluginSpec
local spec = {
  "antosha417/nvim-lsp-file-operations",

  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Uncomment whichever supported plugin(s) you use
    "nvim-tree/nvim-tree.lua",
    -- "nvim-neo-tree/neo-tree.nvim",
    -- "simonmclean/triptych.nvim"
  },
  opts = {

  },

  config = function(_, opts)
    require("lsp-file-operations").setup(opts)
  end,
}

return spec

