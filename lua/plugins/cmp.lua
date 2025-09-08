---@type NvPluginSpec
local spec = {
  -- Название плагина
  "hrsh7th/nvim-cmp",
  -- Можно указать команду или файлы типов, если нужно
  -- В данном случае не обязательно, оставим пустым
  cmd = nil,
  ft = nil,

  -- Опции плагина
  opts = {
    -- Настройка источников и сортировки
    sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 400 },
      { name = "avante", priority = 1500},
    },

    -- Настройка сортировки, чтобы перемещать Variable вверх
    sorting = {
      priority_weight = 1000,
      comparators = {
        -- Функция для поднятия Variable вверх
        function(entry1, entry2)
          local kind1 = entry1:get_kind()
          local kind2 = entry2:get_kind()

          if kind1 == "Variable" and kind2 ~= "Variable" then
            return true
          elseif kind2 == "Variable" and kind1 ~= "Variable" then
            return false
          end
          return nil
        end,
        -- Остальные стандартные сравниватели
        require("cmp.config.compare").offset,
        require("cmp.config.compare").exact,
        require("cmp.config.compare").score,
        require("cmp.config.compare").kind,
        require("cmp.config.compare").sort_text,
        require("cmp.config.compare").length,
        require("cmp.config.compare").order,
      },
    },
    performance = {
        -- It is recommended to increase the timeout duration due to
        -- the typically slower response speed of LLMs compared to
        -- other completion sources. This is not needed when you only
        -- need manual completion.
        fetching_timeout = 2000,
    },
  },

  -- Конфигурация при запуске плагина
  config = function(_, opts)
    local cmp = require "cmp"
    cmp.setup(opts)
  end,
}

return spec

