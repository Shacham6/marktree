local buf = vim.api.nvim_create_buf(false, true)

local border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

local current_window = vim.api.nvim_get_current_win()
local current_height = vim.api.nvim_win_get_height(current_window)
local current_width = vim.api.nvim_win_get_width(current_window)

local float = vim.api.nvim_open_win(buf, true, {
  row = current_height / 2 / 2,
  col = current_width / 4,
  height = math.floor(current_height / 2),
  width = math.floor(current_width / 2),
  border = border,
  relative = "win",
  title = "Attempt",
})

-- vim.api.nvim_buf_set_text(float, 0, 0, end_row, end_col, replacement)

vim.api.nvim_buf_set_lines(float, 0, -1, false, {
  "this is a line",
  "",
  "so is this",
})
