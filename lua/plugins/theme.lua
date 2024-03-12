-- https://github.com/rose-pine/neovim
return {
  
  "rose-pine/neovim",
  --"rebelot/kanagawa.nvim",

  name = "rose-pine",
  --name = "kanagawa",

  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme rose-pine-moon")
    --vim.cmd("colorscheme kanagawa")
  end,
}
