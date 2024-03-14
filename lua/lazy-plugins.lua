-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
require("lazy").setup({
  --
  -- Plugin Spec:
  -- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-plugin-spec
  --


  -- TODO: the `gc` acts strange… how to fix it?
  require("plugins/comment"),

  require("plugins/indent-blankline"),

  --require("kickstart/plugins/gitsigns"),

  --require("kickstart/plugins/which-key"),

  --require("kickstart/plugins/lspconfig"),

  --require("kickstart/plugins/conform"),

  --require("kickstart/plugins/cmp"),

  require("plugins/telescope"),

  require("plugins/theme"),

  require("plugins/todo-comments"),

  require("plugins/treesitter"),

  -- TODO: check if it really works
  require("plugins/vim-sleuth"),

  --require("kickstart/plugins/mini"),

  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      require = "🌙",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
})
