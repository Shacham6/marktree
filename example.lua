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

local float_buff = vim.api.nvim_win_get_buf(float_win)

vim.keymap.set("n", "q", function()
	vim.print("called the thing")
	vim.cmd([[quit]])
end, {
	buffer = float_buff,
})

-- Read about :map-meta-keys
-- :key-notation
-- :key-codes
-- :keycodes

for _, prefix in ipairs({ "'", "`" }) do
	for i = 0, 10, 1 do
		local shortcut = string.format("%s%d", prefix, i)
		vim.keymap.set("n", shortcut, function()
			vim.print(string.format("you pressed '%d", i))
		end, {
			buffer = float_buff,
		})

		for chrByte = string.byte("a"), string.byte("z") do
			local chr = string.char(chrByte)
			shortcut = string.format("%s%d%s", prefix, i, chr)
			vim.keymap.set("n", shortcut, function()
				vim.print(string.format("pressed shortcut is %s", shortcut))
			end, {
				buffer = float_buff,
			})
		end
	end
end

vim.keymap.set("n", "'", function()
	vim.print("just a toggle")
end, {
	-- nowait = true,
	buffer = float_buff,
})

-- vim.keymap.set("n", "'", function()
-- 	vim.print("just a toggle!")
-- end, {
-- 	nowait = true,
-- 	buffer = float_buff,
-- })

vim.keymap.set("n", "<m-s>", function()
	vim.print("wow")
end)

vim.api.nvim_buf_set_lines(float_buff, 0, 3, false, {
	"this is a line",
	"",
	"so is this",
})
