vim.api.nvim_set_keymap('n', 'y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('n', 'yy', '"+yy', { noremap = true })
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true })

-- cut
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('v', 'x', '"+d', { noremap = true })

-- Paste from clipboard
vim.api.nvim_set_keymap('n', 'p', '"+p', { noremap = true })
vim.api.nvim_set_keymap('v', 'p', '"_dP', { noremap = true })

-- save and quit and select all
vim.api.nvim_set_keymap('n', '<C-s>', '<cmd>w!<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-q>', '<cmd>q!<cr>', { noremap = true })

-- split
vim.api.nvim_set_keymap('n', 'sv', '<cmd>vplit<cr>', { noremap = true })
vim.api.nvim_set_keymap('n', 'ss', '<cmd>split<cr>', { noremap = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<A-j>', ":m .+1<CR>==", { silent = true })
vim.keymap.set('n', '<A-k>', ":m .-2<CR>==", { silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { silent = true })
