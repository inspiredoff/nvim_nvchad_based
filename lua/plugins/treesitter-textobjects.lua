return {
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = {
      textobjects = {
        -- Выделение объектов
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Универсальные (работают везде, где есть поддержка)
            ["aa"] = "@parameter.outer",  -- Внешняя часть аргумента
            ["ia"] = "@parameter.inner",  -- Внутренняя часть аргумента
            ["ab"] = "@block.outer",      -- Блок кода (if/for/function/etc.)
            ["ib"] = "@block.inner",

            -- Python-специфичные
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",

            -- Lua-специфичные
            ["aF"] = "@function.outer",
            ["iF"] = "@function.inner",

            -- SQL-специфичные
            ["aq"] = "@query.outer",
            ["iq"] = "@query.inner",
          },
        },

        -- Навигация между объектами
        move = {
          enable = true,
          set_jumps = true,  -- Добавляет в jumplist
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]q"] = "@query.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
            ["]Q"] = "@query.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
            ["[q"] = "@query.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
            ["[Q"] = "@query.outer",
          },
        },

        -- Обмен параметров/аргументов
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sa"] = "@parameter.inner",  -- swap next argument
          },
          swap_previous = {
            ["<leader>sA"] = "@parameter.inner", -- swap previous argument
          },
        },

        -- Дополнительные настройки для конкретных языков
        lsp_interop = {
          enable = true,
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup({ textobjects = opts.textobjects })
    end,
  },
}

