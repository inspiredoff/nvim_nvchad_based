require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "q", ":close<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

map({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor { prefer_ex_cmd = true }
end, { desc = "select refactor" })
map({ "x", "n" }, "<leader>rv", function()
  require("refactoring").debug.print_var()
end)
map("n", "<leader>rp", function()
  require("refactoring").debug.printf { below = true }
end)

map("n", "<leader>tp", function()
  require("triforce").show_profile()
end)

map("i", "<C-P>", function()
  vim.lsp.buf.signature_help()
end, { noremap = true, silent = true })

map("n", "<leader>k", function()
  vim.lsp.buf.hover()
  vim.lsp.buf.document_highlight()
end)

--Neogit
map("n", "<leader>gr", "<Cmd>Neogit<CR>", { desc = " Neogit" })
map("n", "<leader>gm", "<Cmd>:lua require('gitlab').choose_merge_request()<CR>", { desc = " choose_merge_request" })

--Neotest
map("n", "<leader>Tm", "<Cmd>:!sh /home/inspiredoff/.config/nvim/lua/scripts.sh<CR>", { desc = "commit migration" })
map("n", "<leader>Tr", "<Cmd>:lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run Test" })
map("n", "<leader>Ts", "<Cmd>:lua require('neotest').summary.toggle()<CR>", { desc = "run summary" })
map("n", "<leader>To", "<Cmd>:lua require('neotest').output_panel.open()<CR>", { desc = "run output_panel" })

--opencode
map({ "n", "x" }, "<C-a>", function() require("opencode").ask("@this: ", { submit = true }) end, { desc = "Ask opencode…" })
map({ "n", "x" }, "<C-x>", function() require("opencode").select() end,                          { desc = "Execute opencode action…" })
map({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end,                          { desc = "Toggle opencode" })

map({ "n", "x" }, "go",  function() return require("opencode").operator("@this ") end,        { desc = "Add range to opencode", expr = true })
map("n",          "goo", function() return require("opencode").operator("@this ") .. "_" end, { desc = "Add line to opencode", expr = true })

map("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,   { desc = "Scroll opencode up" })
map("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end, { desc = "Scroll opencode down" })

-- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
map("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
map("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })

