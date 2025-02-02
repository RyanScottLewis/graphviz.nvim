if not vim.g.graphviz_nvim_loaded then
	-- require("graphviz").setup({})
	vim.api.nvim_buf_create_user_command(0, "GraphExport", function(opts)
		local settings = require("graphviz").config
		local args = opts.fargs[1] or settings.format
		require("graphviz.commands").graph_export(args)
	end, {
		desc = "Export graph",
		--NOTE:-- Why "*"?, because this allow me to use default values
		nargs = "*",
		complete = function()
			return require("graphviz.utils").args_complete()
		end,
	})

	vim.api.nvim_buf_create_user_command(0, "GraphPreview", function()
		local settings = require("graphviz").config
		require("graphviz.commands").graph_preview(settings.preview)
	end, {
		desc = "Graphviz preview on save",
	})
end

vim.g.graphviz_nvim_loaded = true
