---@type NvPluginSpec
local specs = {
  'kevinhwang91/nvim-bqf',
  ft = 'qf',
  opts = {},
  config = function(_, opts)
    require("bqf").setup(opts)
  end,
}

return specs

