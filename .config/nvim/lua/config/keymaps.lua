local keymap = vim.keymap
keymap.set("n", "<localleader>h", ":set hlsearch!<cr>", {desc = "Turn off search highlights"})
keymap.set("n", "<localleader>d", ":bd<cr>", {desc = "delete buffer"})
