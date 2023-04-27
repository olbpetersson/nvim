-- !! vim settings !! --

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.w.clipboard = unnamedplus

-- remove trailing whitespace on save --
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- !! keymaps !! --
-- nvim-tree --
vim.keymap.set("n", "<A-d>", ":NvimTreeToggle<CR>", { silent = true})

vim.keymap.set("n", "<A-1>", ":NvimTreeFindFileToggle<CR>", { silent = true })

-- telescope --
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<A-o>', builtin.find_files, {})
vim.keymap.set('n', '<A-gg>', builtin.git_files, {})
vim.keymap.set('n', '<A-e>', builtin.buffers, {})
vim.keymap.set('n', '<A-w>', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

-- barbar tabs --
vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':BufferPrevious<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':BufferNext<CR>', { silent = true })
vim.keymap.set('n', '<A-q>', ':BufferClose<CR>', { silent = true })
vim.keymap.set('n','<A-S-q>', ':BufferRestore<CR>', { silent = true })

-- custom --
vim.keymap.set('n', '<C-s>', ':w<CR>', { silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { silent = true })

vim.keymap.set('n', '<A-Left>', ':winc h<CR>', { silent = true })
vim.keymap.set('n', '<A-Right>', ':winc l<Cr>', { silent = true })
vim.keymap.set('n', '<A-h>', ':winc h<CR>', { silent = true })
vim.keymap.set('n', '<A-l>', ':winc l<Cr>', { silent = true })
vim.keymap.set('n', '<A-S-l>', ':1 winc <<Cr>', { silent = true })
vim.keymap.set('n', '<A-S-h>', ':1 winc ><Cr>', { silent = true })

vim.keymap.set('n', '<A-S-Up>', ':m .-2<CR>', { silent = true })
vim.keymap.set('n', '<A-S-Down>', ':m .+1<CR>', { silent = true })
vim.keymap.set('v', '<A-S-Up>', ':m .-2<CR>', { silent = true })
vim.keymap.set('v', '<A-S-Down>', ':m .+1<CR>', { silent = true })
vim.keymap.set('i', 'jj', '<Esc>', { silent = true })

