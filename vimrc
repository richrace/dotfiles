runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

set t_ut=

syntax enable
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

if &diff
  set background=light
  colorscheme github
  set diffopt+=iwhite
else
  set background=dark
  colorscheme lucid
  let NERDTreeShowHidden=1
  autocmd vimenter * NERDTree
endif

set wrap
set nu

au VimEnter * if &diff | execute 'windo set wrap' | endif

autocmd BufWritePre * :%s/\s\+$//e

set expandtab
set tabstop=4
set shiftwidth=2

set colorcolumn=80

function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

au BufWritePre * call TrimEndLines()
