vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 
vim.opt.expandtab = true

-- vim.opt.autochdir = true
vim.w.clipboard = unnamedplus

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>t", ":NvimTreeFindFile<CR>")




