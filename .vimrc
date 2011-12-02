set nocp
set dir=/tmp,$HOME/tmp
set history=100
set runtimepath+=,/home/sashan/.vim/fuzzyfinder,/home/sashan/.vim/l9,/home/sashan/.vim/clang_complete,/home/sashan/.vim/ack

"disable bells
set noerrorbells
set vb t_vb=

if has("gui_running")
  "set guifont=Comic\ 11
  "set guifont=Monospace\ 11
  set guifont=inconsolata\ 13
  "set guifont=Andale\ Mono\:h12
  "set guifont=SerafettinCartoon\ 11
  colorscheme ir_black
  "disable menu, gui etc...who needs a mouse?
  set guioptions=agi
else
  colorscheme ir_black
endif

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

"map \s to loading the vimrc file
map <leader>s :source ~/.vimrc<cr>

"Open the directory browser that the current windowed file is in
map <leader>e :Vex<cr>

"start fuzzyfinderbuffer
map <leader>b :FufBuffer<cr>

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

"insert e with diacritics - e.g: èéêë
imap <leader>ue1 <C-V>u00e8
imap <leader>ue2 <C-V>u00e9
imap <leader>ue3 <C-V>u00ea
imap <leader>ue4 <C-V>u00eb

"useful menu at the bottom of the screen
set wildchar=<TAB> wildmenu wildmode=full
set wildignore=*.o,*.cmx,*.cma,*.cmi,*.cmo


"ignore case when searching
set ignorecase

"Don't wrap long lines
set nowrap

"Convert tabs to spaces 
set noexpandtab

set tabstop=2
set shiftwidth=2
set softtabstop=2

"allow the cursor free range of movement in all modes (visual, insert etc..)
set virtualedit=block

set path=.,/usr/include/**

"Insert newline after 80 characters
set textwidth=80

"Give the status line a line of it's own so it's not shared with the command 
"line
set laststatus=2

" It's useful to show the buffer number in the status line.
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

filetype plugin indent on
syntax on
autocmd BufEnter,BufRead *mutt-* set textwidth=80 formatoptions=taqw nopaste
"autocmd BufEnter *.ml set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
"autocmd BufEnter *.txt set tabstop=2 shiftwidth=2 softtabstop=2 textwidth=80
"autocmd BufEnter *.java set noexpandtab textwidth=0
"autocmd BufLeave *.* set tabstop=3 shiftwidth=3 softtabstop=3 textwidth=0

let g:clang_complete_copen=1
let g:clang_periodic_quickfix=0
let g:clang_debug=0
"let g:clang_user_options='-fblocks -isysroot /Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator4.3.sdk -D__IPHONE_OS_VERSION_MIN_REQUIRED=40300'
let g:clang_user_options='-I/home/sashan/code/repos/mercurial/opensaf/osaf/libs/core/include -I/home/sashan/code/repos/mercurial/opensaf/osaf/libs/common/clmsv/include' .
			\'-I/home/sashan/code/repos/mercurial/opensaf/osaf/libs/common/cpsv/include' .
			\'-I/home/sashan/code/repos/mercurial/opensaf/osaf/services/infrastructure/dtms/include'

"define a script variable that indexes into the colorscheme array
"these contain my favourite colorschemes
let s:colorschemes = ['synic', 'ir_black', 'ps_color',
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

function! ChangeProfile(name)
  if a:name == "opensaf"
    let g:clang_user_options='-I/home/sashan/code/repos/mercurial/opensaf/osaf/libs/core/include -I/home/sashan/code/repos/mercurial/opensaf/osaf/libs/common/clmsv/include'
  endif
endfunction


