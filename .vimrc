
"----------------- Start Vundle Setup ------------------------------------"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set nocompatible
filetype off
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'dracula/vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'eugen0329/vim-esearch'
Plugin 'easymotion/vim-easymotion'
Plugin 'ciaranm/detectindent'
Plugin 'gmarik/Vundle.vim'
Plugin 'szw/vim-dict'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sjl/gundo.vim.git'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'bruno-/vim-man'
Plugin 'elixir-lang/vim-elixir'
Plugin 'sheerun/vim-polyglot'
Plugin 'airblade/vim-gitgutter'
Plugin 'ajmwagar/vim-deus'
Plugin 'chriskempson/base16-vim'
Plugin 'sashang/vim-chroot-build'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'scrooloose/syntastic'
Plugin 'ayu-theme/ayu-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
"Plugin 'prabirshrestha/async.vim'
"Plugin 'prabirshrestha/vim-lsp'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif
"Plugin 'lighttiger2505/deoplete-vim-lsp'
"Plugin 'mattn/vim-lsp-settings'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" All plugins must be added before the following line
call vundle#end()

set hidden
filetype plugin indent on

"----------------- End Vundle Setup ------------------------------------"

"------------------------------- Functions ----------------------------------"

function! SetFont()
    let res=system('xrandr | egrep "\*" | cut -f 4 -d " "')
    if res =~ "2560x1440"
        set guifont=inconsolata\ 14
    else
        set guifont=inconsolata\ 12
    endif
endfunction

"define a script variable that indexes into the colorscheme array
"these contain my favourite colorschemes
let s:colorschemes = ['palenight', 'ayu', 'deus', 'jellybeans', 'no-quarter',
      \ 'solarized', 'wombat', 'synic', 'ir_black', 'ps_color',
      \ 'brookstream', 'darkspectrum', 'inkpot', 'freya', 'anokha']
let s:colorscheme_idx = 0

"function that rotates through the colorscheme array.
function! RotateColorscheme()
    let s:colorscheme_idx += 1
    if s:colorscheme_idx >= len(s:colorschemes)
        let s:colorscheme_idx = 0
    endif
    let l:name = s:colorschemes[s:colorscheme_idx]
    execute 'colorscheme '.l:name
endfunction
"------------------------------ End Functions -----------------------------"

"--------------- Plugin configuration ----------------------------------"

"settings for better whitespace, a plugin that marks trailing whitespace
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

"settings for fsharp
"let g:fsharp_map_keys = 0
"let g:syntastic_fsharp_checkers=['syntax']
"let g:fsharp_xbuild_path = "/usr/bin/msbuild"

" Use deoplete.
let g:deoplete#enable_at_startup = 1

set completefunc=LanguageClient#complete
let g:LanguageClient_serverCommands = {
    \ 'fsharp': ['dotnet', '/home/sashan/code/fsharp-language-server/src/FSharpLanguageServer/bin/Release/netcoreapp3.0/FSharpLanguageServer.dll'],
    \ 'cpp': ['clangd'],
    \ }
nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> <leader>t :call LanguageClient#textDocument_hover()<CR>

"settings for vim-chroot-build
let g:vcb_user = 'sashan'
let g:vcb_chroot_name = 'sles12.2'
let g:vcb_cc = 'ccache\ gcc'
let g:vcb_cxx = 'ccache\ g++'

"detect indent plugin customization
let g:detectindent_preferred_expandtab = 1
let g:detectindent_preferred_indent = 4
let g:detectindent_preferred_when_mixed = 4

"settings for airline
let g:airline_section_error = airline#section#create_right(['%{g:asyncrun_status}'])
let g:airline_theme="palenight"

"set dictionaries to use for looking up words online with vim-dict
let g:dict_hosts = [["dict.org", ["gcide","wn"]]]

"configure esearch to use the quickfix view instead.
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'vim8',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'hlsearch', 'last'],
  \}

"ctrlp customization
let g:ctrlp_by_filename = 0
let g:ctrlp_working_path_mode = 'rwa'
let g:ctrlp_max_files = 0


"----------------------------- Customizations -------------------------------"

syntax on
set shell=bash
set dir=/tmp,$HOME/tmp
set history=100

"allow switching between buffers that have not been written yet - by default vim prohibits this
set hidden

"turn off two spaces after period
set nojs

"incremental search
set incsearch

"scrolloff - forces lines that would be truncated by the bottom/top edges to
"show
set scrolloff=5

"This carries the indent from the previous line onto the next line
set autoindent

set background=dark

"make life easy
nmap ; :
vmap ; :
"toggle show list (shows whitespace characters)
nmap <leader>l :set list!<cr>

"toggle highlight search
nmap <leader>h :set hlsearch!<cr>

"nmap \d to deleting buffers
nmap <leader>d :bd!<cr>

"nmap \f to most recently used files
nmap <leader>pf :CtrlPMRU<cr>

"start ctrlp Most Recently used buffers
nmap <leader>pb :CtrlPBuffer<cr>

nmap <leader>pp :CtrlP .<cr>

"Open the directory browser that the current windowed file is in
nmap <leader>e :Vex<cr>

"open man page for word under cursor. Uses vim-man plugin.
nmap <leader>K :Man <C-r><C-w><cr>


"force reload of buffer from file
nmap <leader>r :edit!<cr>
nmap <leader>e :Vexplore<cr>
nmap <leader>w :botright cwindow<cr>
nmap <leader>] :botright ptnext<cr>
nmap <leader>[ :botright ptprev<cr>
nmap <c-h> <c-w><c-h>
nmap <c-l> <c-w><c-l>
nmap <c-j> <c-w><c-j>
nmap <c-k> <c-w><c-k>
"paste whats in the clipboard register (defined by a mouse selection)
nmap <leader>p :set paste<cr>"*p:set nopaste<cr>

"toggle Gundo
nmap <leader>g :GundoToggle<cr>

"useful menu at the bottom of the screen
set wildchar=<TAB> wildmenu wildmode=full
set wildignore=*.o,*.cmx,*.cma,*.cmi,*.cmo,*.so,*.a,.git

"jump to regex matches
set showmatch

"disable splash message
set shortmess+=I

set spelllang=en_gb

"ignore case when searching
set ignorecase

"infer case when using ctrl-n (autocompletion)
set infercase

"no ignorecase if Uppercase char is present
set smartcase

"don't bother with backup files
set nobackup
set noswapfile

"Don't wrap long lines
set nowrap

"Convert tabs to spaces
set expandtab

set tabstop=4
set shiftwidth=4
set softtabstop=4

"disable bells
set noerrorbells novb
set vb t_vb=

"allow the cursor free range of movement in all modes (visual, insert etc..)
set virtualedit=block

set textwidth=80

"Give the status line a line of it's own so it's not shared with the command
"line
set laststatus=2

set foldcolumn=0

" It's useful to show the buffer number in the status line.
" set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" disable prompt to reload file when changed
autocmd FileChangedShell * echon ""
autocmd BufReadPost * :DetectIndent
autocmd BufRead,BufNewFile,BufEnter *.yml.template setlocal syntax=yaml
autocmd BufRead,BufNewFile,BufEnter *.eliom,*.eliomi setlocal syntax=ocaml
autocmd BufRead,BufNewFile,BufEnter *.elm setlocal autoindent expandtab tabstop=2 softtabstop=2 shiftwidth=2
autocmd BufEnter,BufRead *mutt-* set textwidth=100 formatoptions=taqw nopaste
autocmd BufRead,BufNewFile,BufEnter *.asciidoc,*.adoc
     \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
     \ textwidth=100 wrap formatoptions=tcqn
     \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
     \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

"
"autocmd BufEnter *.ml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
"autocmd BufEnter *.java set noexpandtab textwidth=0
"autocmd BufLeave *.* set tabstop=3 shiftwidth=3 softtabstop=3 textwidth=0
"

"ayu theme customization
let ayucolor="mirage"
if (has("termguicolors"))
  set termguicolors
endif

"change the Pmenu - sometimes depending on colorscheme it is a horrid pink
"colour. This hack get's rid of it.
highlight clear Pmenu

"some customization if running gvim
if has("gui_running")
    colorscheme deus

    "disable menu, gui etc...who needs a mouse?
    set guioptions=agi

    call SetFont()
else
    hi Normal ctermbg=None
    colorscheme palenight
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myundodir = expand('$HOME/.vim/myundodir')
    " Create dirs
    call system('mkdir ' . expand('$HOME/.vim'))
    call system('mkdir ' . myundodir)
    let &undodir = myundodir
    set undofile
endif
"--------------------------End Customizations -------------------------------"
