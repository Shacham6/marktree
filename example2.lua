-- vim.cmd([[
-- Arpeggionmap ' :lua print('praise the sun!!')<cr>
-- ]])

vim.g.arpeggio_timeoutlen = 400
vim.keymap.set("n", "\\", function()
	print("praise the sun!!")
end)
vim.fn["arpeggio#map"]("n", "", 0, [[\]], "<cmd>lua print('praise the sun')<cr>")
vim.fn["arpeggio#map"]("n", "", 0, [[\1]], "<cmd>lua print('praise the 1')<cr>")
vim.fn["arpeggio#map"]("n", "", 0, [[\2]], "<cmd>lua print('praise the 2')<cr>")
vim.fn["arpeggio#map"]("n", "", 0, [[\3]], "<cmd>lua print('praise the 3')<cr>")
vim.fn["arpeggio#map"]("n", "", 0, [[\4]], "<cmd>lua print('praise the 4')<cr>")
vim.fn["arpeggio#map"]("n", "", 0, [[\5]], "<cmd>lua print('praise the 5')<cr>")
