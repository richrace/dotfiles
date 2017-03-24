runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

syntax enable
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
set cursorline

if &diff
  set background=light
  colorscheme github
  set diffopt+=iwhite
else
  set background=dark

  colorscheme molokai

  let NERDTreeShowHidden=1
  autocmd vimenter * NERDTree

  let g:ctrlp_dont_split = 'nerdtree'
endif

set wrap
set nu

au VimEnter * if &diff | execute 'windo set wrap' | endif

autocmd BufWritePre * :%s/\s\+$//e

set expandtab
set tabstop=4
set shiftwidth=2
set shell=/bin/sh
set colorcolumn=80

function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

au BufWritePre * call TrimEndLines()
