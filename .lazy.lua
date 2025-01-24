return {
	{
		"kana/vim-submode",
		lazy = false,
	},
	{
		"kana/vim-arpeggio",
		lazy = false,
	},
	{
		"nvimtools/hydra.nvim",
		lazy = false,
		-- config = function()
		-- require("hydra").setup({})
		-- local hydra = require("hydra")
		-- hydra.heads_spec
		-- hydra.setup({
		-- 	on_enter = function()
		-- 		print("entering")
		-- 	end,
		--
		-- 	on_exit = function()
		-- 		print("exiting")
		-- 	end,
		-- })
		-- end,
	},
	{
		dir = ".",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		lazy = false,
	},
	{
		"cbochs/portal.nvim",
		-- Optional dependencies
		dependencies = {
			"cbochs/grapple.nvim",
			"ThePrimeagen/harpoon",
		},
		lazy = false,
	},
}
