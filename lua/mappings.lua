require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "q", ":close<CR>", { noremap = true, silent = true })
map("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

-- --diffview
-- map("n", "<leader>dq", "<Cmd>DiffviewClose<CR>")
-- map("n", "<leader>dh", "<Cmd>DiffviewFileHistory %<CR>")
-- map("n", "<leader>dq", ":DiffviewOpen<CR>")
-- -- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

--refactor
-- map({ "n", "x" }, "<leader>rr", function()
--   local success, result = pcall(function()
--     require("refactoring").select_refactor({prefer_ex_cmd = true})
--   end)
--
--   if not success then
--     -- Handle the case where there are no refactorable items
--     if result:match("no function usages to inline") or result:match("no refactorable items") then
--       vim.notify("No refactorable items found in current context", vim.log.levels.WARN)
--     else
--       -- Re-raise the error if it's not the expected one
--       error(result)
--     end
--   end
-- end, { desc = "select refactor" })

map({ "n", "x" }, "<leader>rr", function()
  require("refactoring").select_refactor { prefer_ex_cmd = true }
end, { desc = "select refactor" })
map({ "x", "n" }, "<leader>rv", function()
  require("refactoring").debug.print_var()
end)
map("n", "<leader>rp", function()
  require("refactoring").debug.printf { below = true }
end)

map("n","<leader>tp", function ()
  require("triforce").show_profile()
end)
--Neogit
map("n", "<leader>gr", "<Cmd>Neogit<CR>", { desc = " Neogit" })
map("n", "<leader>gm", "<Cmd>:lua require('gitlab').choose_merge_request()<CR>", { desc = " choose_merge_request" })

