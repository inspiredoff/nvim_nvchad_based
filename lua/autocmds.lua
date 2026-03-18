require "nvchad.autocmds"

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local last_line = vim.fn.line "$"
    local last_line_content = vim.fn.getline(last_line)
    if last_line_content ~= "" then
      vim.fn.append(last_line, "")
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

-- 2. Переменные для таймеров
local hover_timer = nil
local clear_timer = nil
local HOVER_DELAY = 300

-- 3. Функция показа
-- 5. Автокоманда на движение курсора
autocmd("CursorMoved", {
  group = vim.api.nvim_create_augroup("AutoLspHover", { clear = true }),
  callback = function()
    if hover_timer then
      hover_timer:stop()
    end

    if clear_timer then
      clear_timer:stop()
    end

    vim.lsp.buf.clear_references()

    hover_timer = vim.defer_fn(function()
      vim.lsp.buf.document_highlight()
      hover_timer = nil
    end, HOVER_DELAY)

  end,
})

-- 6. (Опционально) Мгновенная очистка при начале ввода
autocmd("InsertEnter", {
  group = "AutoLspHover",
  callback = function()
    if hover_timer then
      hover_timer:stop()
    end
    if clear_timer then
      clear_timer:stop()
    end
    vim.lsp.buf.clear_references()
  end,
})

