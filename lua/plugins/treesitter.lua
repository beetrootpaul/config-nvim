
return {
  {
-- https://github.com/nvim-treesitter/nvim-treesitter
--
	  -- Highlight, edit, and navigate code
-- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',

    build = ':TSUpdate',

    opts = {
      ensure_installed = {
	      'bash',
	      'css',
	      'html',
	      'javascript',
	      'json',
	      'lua',
	      'markdown',
	      'toml',
	      'typescript',
	      'vim',
	      'vimdoc',
      },
      -- Autoinstall languages that are not installed
      --auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    },

    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)

      -- TODO: check these:
      --
      -- There are additional nvim-treesitter modules that you can use to interact
      -- with nvim-treesitter. You should go explore a few and see what interests you:
      --
      --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
      --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
      --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    end,
  },
}

