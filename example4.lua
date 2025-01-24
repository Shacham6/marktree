local Hydra = require("hydra")

local items = {
	{ "<leader>", function() end, { exit_before = true } },
}
for number = 0, 9, 1 do
	table.insert(items, {
		string.format("%d", number),
		function()
			print(string.format("pressed %d", number))
		end,
	})
end

for char_byte = string.byte("a"), string.byte("z"), 1 do
	local char = string.char(char_byte)

	table.insert(items, {
		string.format("%s", char),
		function()
			print(string.format("pressed %s", char))
		end,
	})
end

Hydra:initialize({
	name = "Example",
	mode = "n",
	-- body = [[<leader>m]],
	-- body = [[\]],
	opts = {},
	options = {},
	config = {
		opts = {},
		options = {},
		invoke_on_body = true,
		desc = "Hmm",

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

vim.keymap.set({ "n" }, [[\]], function()
	Hydra:activate()
end)
vim.keymap.set({ "n" }, [[']], function()
	Hydra:activate()
end)
vim.keymap.set({ "n" }, [[<leader>m]], function()
	Hydra:activate()
end)
-- Hydra:activate()
-- Hydra:activate()
-- Hydra:activate()
