-- TODO: signs whether a line was modified vs git
-- TODO: format with Prettier?
-- TODO: find some command to jump to next git-modified line in the file
-- TODO: after having some working setup: go through it once again, check for missing features etc.
-- TODO: code completion
-- TODO: consider disabling ligatures: `<leader>=` is an example of `>=` ligature for `=`j
-- TODO: learn how to make line into a code comment
-- TODO: split config into separate dirs/files under lua/brp/init.lua & lua/brp/something/lua (remember the require from the inside nested dir still needs to specify full path with dots)
-- TODO: enable backspace
-- TODO: consider optional lazy.nvim dependency: Nerdfonts https://www.nerdfonts.com/
-- TODO: consider optional telescope.nvim dependencies: ripgrep, native sorters, other optional deps https://github.com/nvim-telescope/telescope.nvim

--
-- lazy.nvim: boostrap
-- See: https://github.com/folke/lazy.nvim#-installation
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set <leader> to space
-- Important: has to be done before `require("lazy").setup(…)`
vim.g.mapleader = " "

-- lazy.nvim: setup plugins
require("lazy").setup({
	{
		-- https://github.com/rose-pine/neovim
		'rose-pine/neovim',
		name = 'rose-pine',
		config = function()
			require('rose-pine').setup({
				--variant = 'main',
				variant = 'moon',
			})
			vim.cmd('colorscheme rose-pine')
		end
	},
	{
		-- https://github.com/nvim-telescope/telescope.nvim
		'nvim-telescope/telescope.nvim',
		tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<C-p>', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			--vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			--vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
			--vim.keymap.set('n', '<leader>gs', builtin.grep_string, {})
			--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = {
					-- list of available values: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
					"bash",
					-- https://github.com/stsewd/tree-sitter-comment
					"comment",
					"css",
					"csv",
					-- https://github.com/the-mikedavis/tree-sitter-diff
					"diff",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitignore",
					"html",
					"javascript",
					"jq",
					"lua",
					"make",
					"markdown",
					"ssh_config",
					"toml",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		-- https://github.com/ThePrimeagen/harpoon
		"ThePrimeagen/harpoon",
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<leader>m", mark.add_file)
			vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
			vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
			vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
		end
	},
	{
		-- https://github.com/mbbill/undotree
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{
		-- https://github.com/tpope/vim-fugitive
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
		end,
	},

	-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/lazy-loading-with-lazy-nvim.md
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup, we are doing it manually
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		'williamboman/mason.nvim',
		lazy = false,
		config = true,
	},

	-- Autocompletion
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				formatting = lsp_zero.cmp_format(),
				mapping = cmp.mapping.preset.insert({
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					['<C-f>'] = cmp_action.luasnip_jump_forward(),
					['<C-b>'] = cmp_action.luasnip_jump_backward(),
				})
			})
		end
	},

	-- LSP
	{
		'neovim/nvim-lspconfig',
		cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
		},
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require('lsp-zero')
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/lazy-loading-with-lazy-nvim.md

				-- TODO: consider replacing the above with:
				--[[
				vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
  end
})
				--]]
				lsp_zero.default_keymaps({ buffer = bufnr })

				vim.keymap.set({ 'n', 'x' }, '<leader>=', function()
					vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
				end, { buffer = bufnr })
			end)

			require('mason-lspconfig').setup({
				ensure_installed = {
					-- available LSPs: https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
					"bashls",
					"cssls",
					"html",
					"jsonls",
					"lua_ls",
					"marksman",
					"tsserver",
					"vimls",
					"yamlls",
				},
				-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require('lspconfig').lua_ls.setup(lua_opts)
					end,
				}
			})
		end
	}
})

-- open file explorer (`pv` = project view)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- TODO: issue: scroll position is lost
-- format entire file
-- Sequence: jump to file start, enter visual mode, jump to file end, format, jump to the prev location (the one from before `gg`)
--vim.keymap.set("n", "<leader>=", "ggvG=<C-o>")
-- TODO: is it possible to make above LspZeroFormat if available for a given lang, then regular `=` otherwise?
