---@type NvPluginSpec
local spec = {
  -- Название плагина или модуля
  "mfussenegger/nvim-lint",

  -- Не указываем команду, так как он запускается автоматически
  cmd = nil,

  -- Можно указать файлы типа, для которых активен lint (опционально)
  ft = { "lua", "python", "sql" },

  -- Опции для настройки lint
  opts = {
    linters_by_ft = {
      lua = { "selene" },
      python = { "ruff", "mypy" },
      sql = { "sqlfluff" },
    },

    -- аргументы для luacheck (можно вынести в opts или оставить внутри)
    -- Обратите внимание, что если нужно переопределить args, лучше делать внутри opts
    -- или через require("lint").linters.luacheck.args
    -- В данном случае, сделаем внутри opts:
    linters = {
      luacheck = {
        args = {
          "--globals",
          "love",
          "vim",
          "--formatter",
          "plain",
          "--codes",
          "--ranges",
          "-",
        },
      },
    },
  },

  -- Конфигурация, которая вызывается при инициализации плагина
  config = function(_, opts)
    require("lint").linters_by_ft = opts.linters_by_ft

    -- Настройка args для luacheck
    if opts.linters and opts.linters.luacheck and opts.linters.luacheck.args then
      require("lint").linters.luacheck.args = opts.linters.luacheck.args
    end

    -- Автоматический запуск lint при событиях
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}

return spec

