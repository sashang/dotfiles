filetype plugin indent on
syntax on
set shell=bash
set nocp
set dir=/tmp,$HOME/tmp
set history=100

"disable bells
set noerrorbells novb
set vb t_vb=

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'szw/vim-dict'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'

" All of your Plugins must be added before the following line
call vundle#end()

if has("gui_running")
  "set guifont=Comic\ 11
  "set guifont=Monospace\ 11
  set guifont=inconsolata\ 13
  "set guifont=Andale\ Mono\:h12
  "set guifont=SerafettinCartoon\ 11
  colorscheme twilight
  "disable menu, gui etc...who needs a mouse?
  set guioptions=agi
else
  colorscheme twilight
endif

"set dictionaries to use for looking up words online with vim-dict
let g:dict_hosts = [["dict.org", ["gcide","wn"]]]

"map ; to : for ease of use
map ; :

"allow switching between buffers that have not been written yet - by default vim prohibits this
set hidden

"incremental search
set incsearch

"This carries the indent from the previous line onto the next line
set autoindent

"toggle show list (shows whitespace characters)
map <leader>l :set list!<cr> 

"toggle highlight search
map <leader>h :set hlsearch!<cr> 

"map \d to deleting buffers
map <leader>d :bd!<cr>

"map \f to format paragraph
map <leader>f vapgq<cr>


"map \s to loading the vimrc file
map <leader>s :source ~/.vimrc<cr>

"Open the directory browser that the current windowed file is in
map <leader>e :Vex<cr>

"start ctrlp Most Recently used buffers
map <leader>b :CtrlPMRU<cr>

"toggle hilights on search text
map <leader>h :set hlsearch!<cr>
map <leader>l :set list!<cr>
map <leader>e :Vexplore<cr>
"map <leader>d :bd<cr>
map <leader>w :botright cwindow<cr>
map <leader>] :botright ptnext<cr>
map <leader>[ :botright ptprev<cr>
map <leader>m :bufdo update<cr>:make -w<cr>
map <c-h> <c-w><c-h>
map <c-l> <c-w><c-l>
map <c-j> <c-w><c-j>
map <c-k> <c-w><c-k>
"paste whats in the clipboard register (defined by a mouse selection) 
map <leader>p :set paste<cr>"*p:set nopaste<cr>


"useful menu at the bottom of the screen
set wildchar=<TAB> wildmenu wildmode=full
set wildignore=*.o,*.cmx,*.cma,*.cmi,*.cmo

"jump to regex matches
set showmatch

"disable splash message
set shortmess+=I

set spelllang=en_gb

"ignore case when searching
set ignorecase

"no ignorecase if Uppercase char is present
set smartcase

"don't bother with backup files
set nobackup

"Don't wrap long lines
set nowrap

"Convert tabs to spaces 
set expandtab

set tabstop=4
set shiftwidth=4
set softtabstop=4

"allow the cursor free range of movement in all modes (visual, insert etc..)
set virtualedit=block

"Insert newline after 80 characters
set textwidth=80

"Give the status line a line of it's own so it's not shared with the command 
"line
set laststatus=2

set foldcolumn=0

" It's useful to show the buffer number in the status line.
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

autocmd BufEnter,BufRead *mutt-* set textwidth=80 formatoptions=taqw nopaste
"autocmd BufEnter *.ml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
"autocmd BufEnter *.java set noexpandtab textwidth=0
"autocmd BufLeave *.* set tabstop=3 shiftwidth=3 softtabstop=3 textwidth=0
"
"asciidoc autocmd
autocmd BufRead,BufNewFile *.txt,*.asciidoc,README,TODO,CHANGELOG,NOTES,ABOUT
        \ setlocal autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ textwidth=100 wrap formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

let g:clang_complete_copen=1
let g:clang_periodic_quickfix=0
let g:clang_debug=0
"let g:clang_user_options='-fblocks -isysroot /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.3.sdk -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300'
let g:clang_user_options='-std=c++98'

"define a script variable that indexes into the colorscheme array
"these contain my favourite colorschemes
let s:colorschemes = ['solarized', 'wombat', 'synic', 'ir_black', 'ps_color',
      \ 'brookstream', 'darkocean', 'inkpot', 'darkspectrum']
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

"change the Pmenu - sometimes depending on colorscheme it is a horrid pink
"colour. This hack get's rid of it.
highlight clear Pmenu
