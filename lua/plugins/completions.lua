-- TODO: what with this file?

return {

	-- https://github.com/hrsh7th/cmp-nvim-lsp
	{
		"hrsh7th/cmp-nvim-lsp",
	},

	-- https://github.com/L3MON4D3/LuaSnip
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			-- https://github.com/rafamadriz/friendly-snippets
			"rafamadriz/friendly-snippets",
		},
	},

	-- https://github.com/saadparwaiz1/cmp_luasnip
	{
		"saadparwaiz1/cmp_luasnip",
	},

	-- https://github.com/hrsh7th/nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
