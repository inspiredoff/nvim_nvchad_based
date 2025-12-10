---@type NvPluginSpec
local spec = {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  ft = { "diff" },
  dependencies = {
    {
      "sindrets/diffview.nvim",
      opts = {
          enhanced_diff_hl = true,
          view = {
          merge_tool = {
            -- Config for conflicted files in diff views during a merge or rebase.
            layout = "diff3_mixed",
            disable_diagnostics = true, -- Temporarily disable diagnostics for diff buffers while in the view.
            winbar_info = true, -- See |diffview-config-view.x.winbar_info|
          },
        },
      },
    },
  },

  opts = {
    signs = { section = { "", "" }, item = { "", "" } },
    disable_commit_confirmation = true,
    integrations = { diffview = true , fzf_lua = true },
  },
  config = function(_, opts)
    require("neogit").setup(opts)
    dofile(vim.g.base46_cache .. "git")
    dofile(vim.g.base46_cache .. "neogit")
  end,
}

return spec

