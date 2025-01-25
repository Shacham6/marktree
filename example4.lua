local Hydra = require("hydra")

local items = {
	{ "<leader>", function() end, { exit_before = true, hide = true } },
}
for number = 0, 9, 1 do
	table.insert(items, {
		string.format([[\%d]], number),
		function()
			print(string.format("want to set file to index %d", number))
			require("harpoon"):list():replace_at(number)
		end,
	})
	table.insert(items, {
		string.format("%d", number),
		function()
			print(string.format("pressed %d", number))
			require("harpoon"):list():select(number)
		end,
		{ hide = true },
	})
end

for char_byte = string.byte("a"), string.byte("z"), 1 do
	local char = string.char(char_byte)

	table.insert(items, {
		string.format([[\%s]], char),
		function()
			print(string.format("want to set mark %s", char))

			local bufnr = vim.api.nvim_get_current_buf()
			local current_window = vim.api.nvim_get_current_win()
			local result = vim.api.nvim_win_get_cursor(current_window)

			local row = result[1]
			local col = result[2]

			vim.api.nvim_buf_set_mark(bufnr, char, row, col, {})
		end,
	})

	table.insert(items, {
		string.format("%s", char),
		function()
			print(string.format("pressed %s", char))
			local bufnr = vim.api.nvim_get_current_buf()
			local current_window = vim.api.nvim_get_current_win()
			local mark_position = vim.api.nvim_buf_get_mark(bufnr, char)
			vim.api.nvim_win_set_cursor(current_window, mark_position)
		end,
		{ hide = true },
	})
end

Hydra({
	name = "Example",
	mode = "n",
	body = [[\]],
	config = {
		invoke_on_body = false,

		on_enter = function()
			print("entered example mode")
		end,

		on_exit = function()
			print("exitted example mode")
		end,

		hint = {
			show_name = false,

			type = "window",
			position = "middle",
		},
		-- timeout = 800,
	},

	heads = items,
})
