-- based on:
--  - https://www.youtube.com/watch?v=zHTeCSVAFNY&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn
--  - https://github.com/dam9000/kickstart-modular.nvim
--  - https://github.com/nvim-lua/kickstart.nvim
--  - https://youtu.be/w7i4amO_zaE?si=Bu8togVkbEQHxao0

-- NOTE: PREREQUISITES:
-- https://github.com/dam9000/kickstart-modular.nvim/blob/master/README.md#install-external-dependencies

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require("options")

-- [[ Basic Keymaps ]]
require("keymaps")

-- [[ Install `lazy.nvim` plugin manager ]]
require("lazy-bootstrap")

-- [[ Configure and install plugins ]]
require("lazy-plugins")
