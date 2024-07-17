return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
			vim.keymap.set("n", "<leader>m", ":Mason<cr>", {})
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			vim.keymap.set("n", "[e", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
			vim.keymap.set("n", "]e", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

			vim.api.nvim_set_keymap(
				"n",
				"<space>e",
				"<cmd>lua vim.diagnostic.open_float()<CR>",
				{ desc = "Enable Diagnostic Popup" }
			)
		end,
	},
}
