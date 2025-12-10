-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "ayu_light",

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  integrations = { "neogit", "diffview" },
}

M.nvdash = {
  load_on_startup = true,
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    { txt = "  Neogit", keys = "gr", cmd = "Neogit" },
    { txt = " Gitlab mr", keys = "gm", cmd = ":lua require('gitlab').choose_merge_request()"},

    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
      content = "fit",
    },
  },
}
M.ui = {
  tabufline = {
    lazyload = false,
  },

  cmp = {
    style = "atom_colored",
  },
  statusline = {
    theme = "vscode_colored",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "session_time",
      "streak",
      "achivments",
      "levels",
      "cwd",
    },
    modules = {
      levels = function()
        return " "
          .. require("triforce.lualine").level {
            show_bar = true,
            -- show_xp = true,
            bar_length = 4,
          }
          .. " "
      end,
      achivments = function()
        return " " .. require("triforce.lualine").achievements()
      end,
      streak = function()
        return " " .. require("triforce.lualine").streak {}
      end,
      session_time = function()
        return require("triforce.lualine").session_time {
          icon = "",
          format = "short",
        }
      end,
    },
  },
}

return M

