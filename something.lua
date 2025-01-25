local harpoon = require("harpoon")

local mainlist = harpoon:list()

-- vim.print(mainlist)

for _, item in ipairs(mainlist.items) do
	vim.print(item)
end
