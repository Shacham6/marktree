local buf = vim.api.nvim_create_buf(false, true)

local border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }

local current_window = vim.api.nvim_get_current_win()
local current_height = vim.api.nvim_win_get_height(current_window)
local current_width = vim.api.nvim_win_get_width(current_window)

local float_width = math.floor(current_width / 2)
local float_height = math.floor(current_height / 2)

local col = (current_width - float_width) / 2
local row = (current_height - float_height) / 2

local float_win = vim.api.nvim_open_win(buf, true, {
	row = row,
	col = col,
	height = float_height,
	width = float_width,
	border = "rounded",
	relative = "win",
	title = "Attempt",
})

-- vim.api.nvim_buf_set_text(float_win, 0, 0, end_row, end_col, replacement)
local float_buff = vim.api.nvim_win_get_buf(float_win)

vim.api.nvim_buf_set_lines(float_buff, 0, 3, false, {
	"this is a line",
	"",
	"so is this",
})
