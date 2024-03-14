return {
-- https://github.com/folke/todo-comments.nvim
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
   event = 'VimEnter', 
   opts = { 
     signs = false ,
   },
}

