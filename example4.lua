local Hydra = require("hydra")
local whichkey = require("which-key")

local items = {
	{ "<leader>", function() end, { exit_before = true, hide = true } },
}
for number = 0, 9, 1 do
	table.insert(items, {
		string.format([[\%d]], number),
		function()
			print(string.format("want to set file to index %d", number))
		end,
	})
	table.insert(items, {
		string.format("%d", number),
		function()
			print(string.format("pressed %d", number))
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
		end,
	})

	table.insert(items, {
		string.format("%s", char),
		function()
			print(string.format("pressed %s", char))
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
