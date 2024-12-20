local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 4 -- 4spaces for tabs (prettier default)
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.shiftround = true

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.hidden = true
opt.autowriteall = true
opt.autoread = true

local fsharp_au_group = vim.api.nvim_create_augroup("fsharp", {clear = true})
vim.api.nvim_create_autocmd("BufEnter", {command = "compiler dotnet", group = fsharp_au_group, pattern = "*.fs"})
vim.api.nvim_create_autocmd("BufEnter", {command = "syntax off", group = fsharp_au_group, pattern = "*.fs,*.fsx"})
vim.api.nvim_command('autocmd BufNewFile,BufRead *.fs,*.fsx,*.fsi,*.fsl,*.fsy set filetype=fsharp')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.fsproj,*.csproj,*.vbproj,*.cproj,*.proj set filetype=xml')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.adoc set filetype=asciidoc textwidth=100')
vim.api.nvim_command('autocmd BufNewFile,BufRead *.json set filetype=json textwidth=100')
vim.g[('fsharp#linter')] = 1
vim.g['fsharp#unused_opens_analyzer'] = 0
vim.g['fsharp#unused_declarations_analyzer'] = 0
