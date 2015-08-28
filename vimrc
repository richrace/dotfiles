runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on

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
endif

set wrap
set nu

au VimEnter * if &diff | execute 'windo set wrap' | endif

autocmd BufWritePre * :%s/\s\+$//e

set expandtab
set tabstop=4
set shiftwidth=2

function TrimEndLines()
  let save_cursor = getpos(".")
  :silent! %s#\($\n\s*\)\+\%$##
  call setpos('.', save_cursor)
endfunction

au BufWritePre * call TrimEndLines()
autocmd vimenter * NERDTree
