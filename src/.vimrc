" General
set nocompatible
filetype on
filetype plugin on
filetype indent plugin on
set ofu=syntaxcomplete#Complete
set modeline
set history=1000
set clipboard+=unnamed
set ffs=unix,dos,mac
set viminfo+=!

" Theme/Colors
set background=dark
syntax on
colorscheme desert

" Pathogen
call pathogen#infect()

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
" General
Bundle "gmarik/vundle"
Bundle "tpope/vim-surround"
Bundle "scrooloose/nerdtree"
Bundle "mattn/zencoding-vim"
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"
Bundle "mattn/calendar-vim"
Bundle "taglist.vim"
Bundle "mileszs/ack.vim"
Bundle "vimwiki"

" Git
Bundle "tpope/vim-fugitive"

" Perl
Bundle "vim-perl/vim-perl"

" Ruby
Bundle "tpope/vim-rails"
Bundle "tpope/vim-haml"
Bundle "tpope/vim-bundler"
Bundle "tpope/vim-rake"
Bundle "vim-ruby/vim-ruby"
" TODO: add a conditional for windows
" look for or write similar plugin for pik
Bundle "tpope/vim-rvm"

" Markdown
Bundle "tpope/vim-markdown"

" Java/JVM
Bundle "tpope/vim-classpath"

" Scala
Bundle "megaannum/self"
Bundle "megaannum/forms" 
Bundle "Shougo/vimproc"
Bundle "Shougo/vimshell"
Bundle "aemoncannon/ensime"
Bundle "megaannum/vimside"


" Files/Backups
"set backup
"set backupdir=$VIM/vimfiles/backup
"set directory=$VIM/vimfiles/temp
"set makeef=error.err

" Vim UI
set wildmenu
set ruler
set cmdheight=1
set number
set lz " do not redraw when running macros
set hid " change buf without saving
set backspace=2
set whichwrap+=<,>,h,l
set mouse=a
set shortmess=atI

" Visual Cues
set showmatch " show matching brackets
set mat=5 " rate of bracket blinkage (in tenths of a sec)
set nohlsearch " no hightligh for search phrases
set incsearch " but do highlight while searching
set so=10
set statusline=%F%m%r%h%w\ \|\ format:%{&ff}\ \|\ type:%y\ \|\ ascii:\%03.3b\ \|\ l%4.4l,\ c%4.4v\ \|\ %3.3p%%\ \|\ len:%L 
set laststatus=2 " always show the status line

" Text Formatting/Layout
set ai " autoindent
set si " smartindent
set cindent " c style indenting
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set wrap
set smarttab

" Tasklist
map T :TaskList<CR>
"map P :TlistToggle<CR>

" Python indent
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType ruby setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

set dict+=~/.vim/dictionaries/drupal50-functions.dict

" Abrev
iab xperl #!/usr/bin/perl<CR>use warnings;<CR>use strict;<CR>
iab xpy #!/usr/bin/python<CR>
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xcfor for (i = 0; i <= 10; i++)<cr>
iab xcs using System;<CR><CR>class NewClass<CR>{<CR><TAB>static void Main ()<CR>{<CR><TAB><CR>}<CR>}

" Vala
autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
au BufRead,BufNewFile *.vala            setfiletype vala
au BufRead,BufNewFile *.vapi            setfiletype vala
