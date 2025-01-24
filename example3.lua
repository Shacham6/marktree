vim.fn["submode#enter_with"]("marktree", "n", "", "\\", "<cmd>lua print('entered the marktree mode')<cr>")

vim.fn["submode#map"]("marktree", "n", "", "a", [[<cmd>lua print("pressed a")<cr>]])
vim.fn["submode#map"]("marktree", "n", "", "b", [[<cmd>lua print("pressed b")<cr>]])
