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
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function () 
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
		config = function () 
			local configs = require("nvim-treesitter.configs")
			configs.setup({
				ensure_installed = { 
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
})

-- open file explorer (`pv` = project view)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- TODO: issue: scroll position is lost
-- format entire file
-- Sequence: jump to file start, enter visual mode, jump to file end, format, jump to the prev location (the one from before `gg`)
vim.keymap.set("n", "<leader>=", "ggvG=<C-o>")
