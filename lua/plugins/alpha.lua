return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		-- "ozthemagician/alpha-cowsays-nvim", -- only works with startify theme
	},

	config = function()
		local alpha = require("alpha")
		local theta = require("alpha.themes.theta") -- unable to set header on theta theme
		alpha.setup(theta.config)
	end,
}
