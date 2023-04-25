vim.g.mapleader = ','
vim.cmd.colorscheme "catppuccin-frappe"

-- Disabled for nvim-tree --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true


vim.opt.number = true


require("packer_plugins")
require("keymap")
require("mason").setup()

