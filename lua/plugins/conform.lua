---@type NvPluginSpec
local spec = {
  -- Название плагина
  "stevearc/conform.nvim",

  -- Загружается при событии сохранения файла
  event = "BufWritePre",

  -- Опции для настройки
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "ruff", "black" }, -- добавляем isort, ruff и black
    },

    formatters = {
      black = {
        prepend_args = {
          "--fast",
          "--line-length",
          "120", -- соответствует line-length из pyproject.toml
        },
      },
      isort = {
        args = {
          "--profile", "black", -- профиль для совместимости с black
          "--line-length", "120", -- длина строки
        },
      },
    },

    -- Можно добавить другие опции, если нужно
  },

  -- Конфигурация при загрузке плагина
  config = function(_, opts)
    require("conform").setup(opts)
    -- дополнительные настройки при необходимости
  end,
}

return spec

