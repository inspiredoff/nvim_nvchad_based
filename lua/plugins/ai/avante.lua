---@type NvPluginSpec
local specs = {
  "yetone/avante.nvim",

  event = "VimEnter",
  ft = { "markdown", "Avante" },
  cmd = {
    "Avante",
    "AvanteChat",
    "AvanteTask",
    "AvanteReview",
  },

  -- Essential dependencies
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick", -- file selector provider
    "nvim-telescope/telescope.nvim", -- file selector provider
    "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua", -- file selector provider
    "stevearc/dressing.nvim", -- input provider
    "folke/snacks.nvim", -- input provider
    "nvim-tree/nvim-web-devicons", -- icons support

    -- AI provider support
    "zbirenbaum/copilot.lua", -- for providers='copilot'

    -- Image support
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true, -- required for Windows users
        },
      },
    },

    -- Markdown rendering
    {
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
    },
  },

  opts = {
    -- Project-specific instructions file
    instructions_file = "avante.md",

    -- Provider configuration
    auto_suggestions_provider = "vk_copilot",
    provider = "vk_copilot",
    providers = {
      vk_copilot = {
        __inherited_from = "openai",
        endpoint = "https://api.copilot.vk.team/v1",
        api_key = "sk-123", -- Use env var (required)
        model = "qwen-3-32b",
        -- timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 64000,
        },
      },
    },
    input = {
      provider = "native",
      provider_opts = {
        -- Additional snacks.input options
        title = "Avante Input",
        icon = " ",
      },
    },
    selector = {
      ---@alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      ---@type avante.SelectorProvider
      provider = "native",
      provider_opts = {},
      exclude_auto_select = {}, -- List of items to exclude from auto selection
    },
    behavior = {
      auto_suggestions = true,
      minimize_diff = true,
      auto_focus_on_diff_view = true,
    },
  },

  config = function(_, opts)
    require("avante").setup(opts)
  end,
}
return specs

