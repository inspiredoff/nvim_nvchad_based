---@type NvPluginSpec
local spec = {
  "hrsh7th/nvim-cmp",
  cmd = nil,
  ft = nil,

  opts = {
    sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 400 },
      { name = "avante", priority = 1500},
    },
    performance = {
        fetching_timeout = 10000,
    },
  },

  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)
  end,
}

return spec

