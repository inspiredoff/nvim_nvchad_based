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
        -- endpoint = "https://ai-proxy.vk.team/v1",
        model = "qwen3-coder",
        -- timeout = 30000, -- Timeout in milliseconds
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 16384,
        },
      },
    },
    input = {
      provider = "snacks",
      provider_opts = {
        -- Additional snacks.input options
        title = "Avante Input",
        icon = " ",
      },
    },
    selector = {
      ---@alias avante.SelectorProvider "native" | "fzf_lua" | "mini_pick" | "snacks" | "telescope" | fun(selector: avante.ui.Selector): nil
      ---@type avante.SelectorProvider
      provider = "snacks",
      provider_opts = {},
      exclude_auto_select = {}, -- List of items to exclude from auto selection
    },
    -- 🔹 Поведение
    behavior = {
      auto_suggestions = true,
      minimize_diff = true,
      auto_focus_on_diff_view = true,
      confirmation_ui_style = "popup",
      auto_apply_diff_after_generation = false,
      enable_token_counting = true,
      auto_add_current_file = true,
      support_paste_from_clipboard = true,
      auto_approve_tool_permissions = false, -- 🔐 Запрашивать подтверждение для инструментов
    },
    windows = {
      position = "right", -- Позиция сайдбара: "right" | "left" | "top" | "bottom"
      wrap = true, -- Перенос строк
      width = 30, -- Ширина в % от экрана

      sidebar_header = {
        enabled = true,
        align = "center",
        rounded = true,
      },

      spinner = { -- Анимации загрузки
        editing = { "⡀", "⠄", ... },
        generating = { "·", "✢", "✳", ... },
        thinking = { "🤯", "🙄" }, -- 😄
      },

      input = {
        prefix = "> ",
        height = 15, -- Высота поля ввода в вертикальном режиме
      },

      ask = {
        floating = false, -- Открыть запрос в плавающем окне
        start_insert = true, -- Сразу войти в режим вставки
        border = "rounded",
        focus_on_apply = "ours", -- На какой дифф фокусироваться после применения
      },
    },
  },

  config = function(_, opts)
    require("avante").setup(opts)
  end,
}
return specs

