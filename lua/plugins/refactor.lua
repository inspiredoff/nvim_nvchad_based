---@type NvPluginSpec
local spec = {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false,

  opts = {
    prompt_func_return_type = {
      py = true,
    },
    prompt_func_param_type = {
      py = true,
    },
    print_var_statements = {
      py = {
        'logging.info(f"!_!_!__!_!_! $s: {%s})',
      },
    },
    show_success_message = false,
  },

  config = function(_, opts)
    require("refactoring").setup(opts)
  end,
}

return spec

