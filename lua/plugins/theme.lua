return {
  {
    -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    --

    -- https://github.com/rebelot/kanagawa.nvim
    --"rebelot/kanagawa.nvim",

    -- https://github.com/rose-pine/neovim
    "rose-pine/neovim",

    -- https://github.com/folke/tokyonight.nvim
    --"folke/tokyonight.nvim",

    priority = 1000, -- make sure to load this before all the other start plugins

    init = function()
      -- Load the colorscheme here.
      -- vim.cmd.colorscheme 'kanagawa'
      vim.cmd.colorscheme("rose-pine-moon")
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
}
