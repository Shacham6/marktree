-- vim.fn.setloclist(nr, list, action?, what?)

-- local function load_buf_thing()
-- 	local bufexists = vim.fn.bufexists("./.lazy.lua")
-- 	vim.print("bufexists = ", bufexists)
-- 	if not vim.fn.bufloaded("./.lazy.lua") then
-- 		return vim.fn.bufnr("./.lazy.lua", true)
-- 	end
-- 	return vim.fn.bufadd("./.lazy.lua")
-- end

local lazy_lua_file = vim.uri_to_bufnr("file://.lazy.lua")
local marklist = vim.fn.getmarklist(lazy_lua_file)
vim.print(marklist)

-- local anon_namespace = vim.api.nvim_create_namespace("")
--
-- vim.diagnostic.toqflist({})
--
-- vim.diagnostic.setloclist({
-- 	open = true,
-- })
