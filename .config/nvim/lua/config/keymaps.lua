local keymap = vim.keymap
keymap.set("n", "<localleader>h", ":set hlsearch!<cr>", {desc = "Turn off search highlights"})
keymap.set("n", "<localleader>d", ":bd<cr>", {desc = "delete buffer"})
keymap.set('n', '<leader>h', vim.lsp.buf.hover, {desc = 'hover tooltip'})
keymap.set('n', 'c-]', vim.lsp.buf.definition, {desc = 'function definition'})
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = 'function definition'})
keymap.set('n', '<leader>z', '<cmd>Centerpad 80<cr>', {desc = 'center the buffer'})

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
