return {
  {
    -- https://github.com/stevearc/conform.nvim
    --
    -- Autoformat
    --
    "stevearc/conform.nvim",

    event = { "BufWritePre" },

    cmd = { "ConformInfo" },

    keys = {
      {
        -- Customize or remove this keymap to your liking
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },

    opts = {

      --notify_on_error = false,
      notify_on_error = true,

      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },

      formatters_by_ft = {
        javascript = { "prettier" },
        json = { "prettier" },
        lua = { "stylua" },
        typescript = { "prettier" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}
