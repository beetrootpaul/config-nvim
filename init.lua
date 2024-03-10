-- based on https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
--vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
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


-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
local plugins = {

  -- https://github.com/folke/which-key.nvim
  --"folke/which-key.nvim",
  --
  -- https://github.com/rose-pine/neovim
  { "rose-pine/neovim", name = "rose-pine" },

  -- https://github.com/nvim-telescope/telescope.nvim
      {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- https://github.com/nvim-treesitter/nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }

}
local opts = {}
require("lazy").setup(plugins, opts)

-- https://github.com/folke/which-key.nvim
--require("which-key").setup()

-- https://github.com/rose-pine/neovim
require("rose-pine").setup()
vim.cmd("colorscheme rose-pine-moon")

-- https://github.com/nvim-telescope/telescope.nvim
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- https://github.com/nvim-treesitter/nvim-treesitter

