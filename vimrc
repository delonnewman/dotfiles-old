" General
"set nocompatible
filetype on
filetype plugin on
filetype indent plugin on
set modeline
set history=1000
set clipboard+=unnamed
set ffs=unix,dos,mac
set viminfo+=!

" Theme/Colors
set background=dark
syntax on
colorscheme molokai

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
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set wrap
set smarttab

set dict+=~/.vim/dictionaries/drupal50-functions.dict

" Abrev
iab xperl #!/usr/bin/perl<CR>use warnings;<CR>use strict;<CR>
iab xpy #!/usr/bin/python<CR>
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>
iab xcfor for (i = 0; i <= 10; i++)<cr>
iab xcs using System;<CR><CR>class NewClass<CR>{<CR><TAB>static void Main ()<CR>{<CR><TAB><CR>}<CR>}

if has("autocmd")
	" Drupal *.module and *.install files.
	augroup module
		autocmd BufRead,BufNewFile *.module set filetype=php
		autocmd BufRead,BufNewFile *.install set filetype=php
	augroup END
endif

