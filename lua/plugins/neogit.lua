---@type NvPluginSpec
local spec = {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  ft = { "diff" },
  dependencies = {
    {
      "sindrets/diffview.nvim",
      opts = {
        view = {
          merge_tool = {
            -- Config for conflicted files in diff views during a merge or rebase.
            layout = "diff3_mixed",
            disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
            winbar_info = true, -- See |diffview-config-view.x.winbar_info|
          },
        },

        hooks = {
          diff_buf_read = function(bufnr)
            -- Change local options in diff buffers
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.colorcolumn = { 80 }
          end,
          view_opened = function(view)
            print(("A new %s was opened on tab page %d!"):format(view.class:name(), view.tabpage))
          end,
        },
      },
    },
  },

  opts = {
    signs = { section = { "", "" }, item = { "", "" } },
    disable_commit_confirmation = true,
    integrations = { diffview = true, telescope = true, fzf_lua = true },
  },
  config = function(_, opts)
    require("neogit").setup(opts)
    dofile(vim.g.base46_cache .. "git")
    dofile(vim.g.base46_cache .. "neogit")
  end,
}

return spec

