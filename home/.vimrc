" Required
set nocompatible
filetype off
syntax enable

" Show line numbers
set number

" Backspace like a normal person
set backspace=indent,eol,start

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Solarized Theme
Bundle 'altercation/vim-colors-solarized'
set background=dark
set rtp+=~/.vim/bundle/vim-colors-solarized
colorscheme solarized

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'tpope/vim-rails'

" Xmpfilter
autocmd FileType ruby nmap <buffer> <D-m> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <D-m> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <D-m> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <D-r> <Plug>(xmpfilter-run)

" Bad Whitespace
Plugin 'bitc/vim-bad-whitespace'

" Git Gutter
Plugin 'airblade/vim-gitgutter'

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_powerline_fonts = 1

" Syntastic
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP
Plugin 'ctrlpvim/ctrlp.vim'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Nerd Tree
Plugin 'scrooloose/nerdtree.git'
autocmd StdinReadPre * let s:std_in=1
autocmd vimenter * NERDTree
autocmd VimEnter * if argc() | wincmd p | endif
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" End wise
Plugin 'tpope/vim-endwise'

" All plugins defined
call vundle#end()


" Ruby, JS, Elixir file settings
au BufRead,BufNewFile *.js,*.rb,*.exs,*.ex,*.eex                 set tabstop=2
au BufRead,BufNewFile *.js,*.rb,*.exs,*.ex,*.eex                 set softtabstop=2
au BufRead,BufNewFile *.js,*.rb,*.exs,*.ex,*.eex                 set shiftwidth=2
au BufRead,BufNewFile *.js,*.rb,*.exs,*.ex,*.eex                 set expandtab
au BufRead,BufNewFile *.js,*.rb,*.exs,*.ex,*.eex                 set smarttab
au BufRead,BufNewFile *.js,*.rb,*.exs,*.ex,*.eex                 set autoindent
au BufRead,BufNewFile *.rb                                       match Error /\%81v.\+/

au BufRead,BufNewFile *.rb                                       match BadWhitespace /^\t\+/
au BufRead,BufNewFile *.rb                                       match BadWhitespace /\s\+$/