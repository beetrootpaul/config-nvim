-- https://github.com/mbbill/undotree
--
-- undo history with UI and branching
--
return {
  "mbbill/undotree",
  opts = {},
  config = function()
    vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
  end,
}
