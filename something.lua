local harpoon = require("harpoon")

local mainlist = harpoon:list()

for _, item in ipairs(mainlist.items) do
	vim.print(item)

	local bufnr = vim.fn.bufadd(item.value)
	print(string.format("bufnr = %d", bufnr))

	for mark_char_byte = string.byte("a"), string.byte("z"), 1 do
		local mark_char = string.char(mark_char_byte)
		local result = vim.api.nvim_buf_get_mark(bufnr, mark_char)
		vim.print(string.format("%s = [%s] %s", item.value, mark_char, vim.inspect(result)))
	end
end
