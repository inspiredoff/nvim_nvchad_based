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

map("n", "<C-P>", function()
  vim.lsp.buf.signature_help()
end)

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

