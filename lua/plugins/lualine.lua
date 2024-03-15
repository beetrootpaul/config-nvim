-- https://github.com/nvim-lualine/lualine.nvim
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup()

    -- Place status line always on the bottom on the entire nvim
    -- instead of the deafult `2` which is the bottom of the
    -- active split.
    --
    -- As a side effect we can see a visual border between splits
    -- one above the other, same as it works by default between
    -- left/right splits.
    --
    vim.o.laststatus = 3
  end,
}
