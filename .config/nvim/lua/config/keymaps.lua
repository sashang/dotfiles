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
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

-- Function to get contents of " register and run FsiEval
function _G.fsi_eval_register()
    -- Get the contents of the " register
    local register_contents = vim.fn.getreg('"')
    -- Escape any double quotes in the register contents
    -- register_contents = register_contents:gsub('^J', '^M')
    -- Construct the FsiEval command with the register contents
    -- local command = 'FsiEval ' .. vim.fn.shellescape(register_contents)
    local command = 'FsiEval ' .. register_contents
    print(command)
    -- Execute the command
    vim.cmd(command)
end

-- Set the mapping for normal mode
vim.api.nvim_set_keymap('n', '<leader>fe', '<cmd>lua fsi_eval_register()<CR>', { noremap = true, silent = true })

-- Set the mapping for visual mode
vim.api.nvim_set_keymap('v', '<leader>fe', 'y<cmd>lua fsi_eval_register()<CR>', { noremap = true, silent = true })
