local function get_dynamic_width()
  local max_length = 0
  -- ищем только файлы и папки в текущей открытой директории (один уровень)
  for _, name in ipairs(vim.fn.globpath(".", "*", 0, 1)) do
    local basename = vim.fn.fnamemodify(name, ":t")
    if #basename > max_length then
      max_length = #basename
    end
  end
  -- Добавляем немного для отступа
  return math.max(30, max_length + 2)
end

---@type NvPluginSpec
local spec = {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  ft = {}, -- можно оставить пустым, если не нужен
  opts = {
    view = {
      side = "left",
      -- Изначально задаем минимальную ширину
      width = get_dynamic_width(),
    },
    actions = {
      open_file = {
        quit_on_open = true, -- закрывать nvim-tree при открытии файла
      },
    },
    update_focused_file = {
      enable = true,
      update_cwd = true,
    },
  },

  config = function(_, opts)
    require("nvim-tree").setup(opts)
  end,
}

return spec
