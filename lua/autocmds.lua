require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local last_line = vim.fn.line('$')
    local last_line_content = vim.fn.getline(last_line)
    if last_line_content ~= '' then
      vim.fn.append(last_line, '')
    end
  end,
})

autocmd("BufDelete", {
  callback = function()
    local bufs = vim.t.bufs
    if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
      vim.cmd "Nvdash"
    end
  end,
})

