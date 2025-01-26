local function get_harpoon_marks_thing()
	local harpoon = require("harpoon")
	local mainlist = harpoon:list()

	local things = {}

	for _, item in ipairs(mainlist.items) do
		-- vim.print(item)

		local bufnr = vim.fn.bufadd(item.value)
		-- print(string.format("bufnr = %d", bufnr))

		local buffer_marks = {}

		for mark_char_byte = string.byte("a"), string.byte("z"), 1 do
			local mark_char = string.char(mark_char_byte)
			local result = vim.api.nvim_buf_get_mark(bufnr, mark_char)

			if result[1] == 0 and result[2] == 0 then
				goto continue
			end

			-- vim.print(string.format("%s = [%s] %s", item.value, mark_char, vim.inspect(result)))
			table.insert(things, {
				bufnr = bufnr,
				filename = item.value,
				position = result,
				mark_char = mark_char,
			})

			::continue::
		end
		-- things[item.value] = buffer_marks
	end

	return things
end

local mark_things = get_harpoon_marks_thing()

local nc = vim.api.nvim_create_namespace("marktree")

local messages = {}

for _, mark_thing in ipairs(mark_things) do
	table.insert(
		messages,
		---@type vim.Diagnostic
		{
			filename = mark_thing.filename,
			lnum = mark_thing.position[1],
			col = mark_thing.position[2],
			text = string.format("mark %s", mark_thing.mark_char),
		}
	)
end

vim.fn.setloclist(0, messages, "r")
