return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,

	opts = {
		plugins = {
			marks = true, -- shows a list of your marks on ' and `
			registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
			-- the presets plugin, adds help for a bunch of default keybindings in Neovim
			-- No actual key bindings are created
			spelling = {
				enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				suggestions = 20, -- how many suggestions should be shown in the list?
			},
			presets = {
				operators = true, -- adds help for operators like d, y, ...
				motions = true, -- adds help for motions
				text_objects = true, -- help for text objects triggered after entering an operator
				windows = true, -- default bindings on <c-w>
				nav = true, -- misc bindings to work with windows
				z = true, -- bindings for folds, spelling and others prefixed with z
				g = true, -- bindings for prefixed with g
			},
		},
	},

	config = function()
		local wk = require("which-key")
		wk.register({
			f = {
				name = "find",
				f = { name = "find files" },
				g = { name = "grep files" },
			},

			o = { name = "open", },

      l = { name = "Lazy" },
      m = { name = "Mason" },

			g = { f = { name = "format" }, },
			c = { a = { name = "code actions - LSP" }, },
		}, { prefix = "<leader>" })
    wk.register({ name = "find files" }, { prefix = "<leader><space>"})

		wk.register({
			K = {
				name = "documentation - LSP",
			},
			g = {
				name = "go to",
				d = { name = "definition - LSP" },
			},
		})

		wk.register(mappings, opts)
	end,
}
