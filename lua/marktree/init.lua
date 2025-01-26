local M = {}

---@param parts string[]
local function str_join(parts)
	local trimmed_parts = {}
	for i = 1, #parts, 1 do
		local trimmed_string = string.gsub(parts[i], [[^[\n \t]+]], "", 1)
		trimmed_parts[i] = trimmed_string
	end
	return table.concat(trimmed_parts, "\n")
end

local function get_harpoon_marks_thing()
	local harpoon = require("harpoon")
	local mainlist = harpoon:list()

	local things = {}

	for item_idx, item in ipairs(mainlist.items) do
		local bufnr = vim.fn.bufadd(item.value)
		for mark_char_byte = string.byte("a"), string.byte("z"), 1 do
			local mark_char = string.char(mark_char_byte)
			local result = vim.api.nvim_buf_get_mark(bufnr, mark_char)

			if result[1] == 0 and result[2] == 0 then
				goto continue
			end

			local lines = vim.api.nvim_buf_get_lines(bufnr, result[1] - 1, result[1], false)
			local lines_buffer = str_join(lines)

			table.insert(things, {
				bufnr = bufnr,
				filename = item.value,
				position = result,
				mark_char = mark_char,
				harpoon_index = item_idx,
				lines_buffer = lines_buffer,
			})

			::continue::
		end
	end

	return things
end

local function get_harpoon_marks_loclist()
	local mark_things = get_harpoon_marks_thing()
	local messages = {}
	for _, mark_thing in ipairs(mark_things) do
		table.insert(messages, {
			filename = string.format("[ %d ] - %s", mark_thing.harpoon_index, mark_thing.filename),
			lnum = mark_thing.position[1],
			col = mark_thing.position[2],
			text = string.format("[ %s ] >> %s", mark_thing.mark_char, mark_thing.lines_buffer),
			context = mark_thing.harpoon_index,
		})
	end
	return messages
end

local function insert_to_loclist(nr, loclist_items)
	-- vim.fn.setloclist(0, messages, "r")
	vim.fn.setloclist(nr, loclist_items, "r")
end

function M.toggle_marktree_trouble()
	local trouble = require("trouble")
	trouble.toggle({
		mode = "loclist",
		title = "Marktree",
		follow = false,
		preview = false,
		auto_preview = false,
		win = {
			focusable = false,
			position = "right",
			size = 70,
		},
	})
end

function M.refresh()
	local marks_loclist = get_harpoon_marks_loclist()
	vim.print(marks_loclist)
	insert_to_loclist(0, marks_loclist)
end

function M.setup(opts)
	vim.api.nvim_create_user_command("MarkTreeRefresh", function()
		M.refresh()
	end, {})

	vim.api.nvim_create_user_command("MarkTreeTrouble", function()
		M.toggle_marktree_trouble()
	end, {})
end

return M
