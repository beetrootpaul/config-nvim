-- TODO: learn how to make line into a code comment
-- TODO: split config into separate dirs/files under lua/brp/init.lua & lua/brp/something/lua (remember the require from the inside nested dir still needs to specify full path with dots)
-- TODO: enable backspace

-- 
-- lazy.nvim: boostrap, copied from https://github.com/folke/lazy.nvim#-installation
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

-- lazy.nvim: setup plugins
require("lazy").setup({})
