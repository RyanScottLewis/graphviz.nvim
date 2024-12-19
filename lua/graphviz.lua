-- local utils = require("graphviz.utils")
-- local commands = require("graphviz.commands")

---@type Graphviz.config
local defaults = {
	format = "pdf",
	preview = "pdf",
}


---@class Graphviz.config
---@field format string
---@field preview string

local M = {}

M.config = defaults

function M.setup(args)
	M.config = vim.tbl_deep_extend("force", M.config, args or {})
	-- M.user_commands()
end

-- function M.user_commands()
-- 	local buf_user_command = vim.api.nvim_buf_create_user_command
-- 	-- Create commands ONLY for dot files
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = "dot",
-- 		-- group = utils.group,
-- 		callback = function()
-- 			buf_user_command(0, "GraphExport", function(opts)
-- 				local args = opts.fargs[1] or M.config.format
-- 				commands.graph_export(args)
-- 			end, {
-- 				desc = "Export graph",
-- 				--NOTE:-- Why "*"?, because this allow me to use default values
-- 				nargs = "*",
-- 				complete = function()
-- 					return utils.args_complete()
-- 				end,
-- 			})
--
-- 			buf_user_command(0, "GraphPreview", function()
-- 				commands.graph_preview(M.config.preview)
-- 			end, {
-- 				desc = "Graphviz preview on save",
-- 			})
-- 		end,
-- 	})
-- end

return M
