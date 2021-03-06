" Init pathogen
set nocompatible
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" My changes start here

" For better switching between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"TODO: problems with ssh
map <S-Return> :tabnew<CR>
map <S-Right> :tabnext<CR>
map <S-Left>  :tabprev<CR>

map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >

map <C-n> :noh<CR>
"TODO: prevents correct work with Quick Fixes
"map <C-m> <C-w>_

set scrolloff=4
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set nowrap
set autoindent
set winminheight=0
set winminwidth=0
set tildeop
set number

" NERDTree mappings
map <Esc>t :NERDTreeToggle<CR>
map <Esc>c :NERDTreeClose<CR>
let NERDTreeIgnore=['\.o$', '\.hi$', '\~$', '\.swp$']
"au VimEnter *  NERDTree

colorscheme metacosm

" auto close options when exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
set completeopt=menu,menuone,preview

" -- configs --
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window
autocmd FileType python set omnifunc=pythoncomplete#Complete

"set foldlevel=0
"set foldmethod=indent

let python_highlight_all = 1

map <F12> <ESC>:ConqueTermSplit bash<CR>

" is it for NERDCommenter?
let mapleader = ","

" For haskellmode
au BufEnter *.hs compiler ghc
"TODO: It is True only for home system
let g:haddock_browser="/usr/bin/google-chrome"
let maplocalleader='\'
"TODO: Could it be automated? - to see the sources
map <LocalLeader>r :GHCReload<CR>

" Not sure if it works
set path=$PWD/**
set tags=./tags,./**/tags,~/.vim/systags

" Source vimrc upon writing it
au BufWritePost *vimrc source $MYVIMRC

" Netrw settings
let g:netrw_liststyle = 3

let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
map <F3>  :call TRANSLATE()<cr>
function! TRANSLATE()
   let  a=getline('.')
   let co=col('.')-1
   let starts=strridx(a," ",co)
   let ends = stridx(a," ",co)
   if ends==-1
       let ends=strlen(a)
   endif
   let res = strpart(a,starts+1,ends-starts)
   let cmds = "sdcv -n " . res
   let out = system(cmds)
   call append(line('.'), split(out, "\n"))
endfunction

"Mappings to scroll other window
fun! ScrollOtherWindow(dir)
    if a:dir == "down"
        let move = "\<C-E>"
    elseif a:dir == "up"
        let move = "\<C-Y>"
    endif
    exec "normal \<C-W>p" . move . "\<C-W>p"
endfun
nmap <silent> <M-Down> :call ScrollOtherWindow("down")<CR>
nmap <silent> <M-Up> :call ScrollOtherWindow("up")<CR>
imap <silent> <M-Down> <ESC>:call ScrollOtherWindow("down")<CR>a
imap <silent> <M-Up> <ESC>:call ScrollOtherWindow("up")<CR>a
nmap <silent> <M-j> :call ScrollOtherWindow("down")<CR>
nmap <silent> <M-k> :call ScrollOtherWindow("up")<CR>
imap <silent> <M-j> <ESC>:call ScrollOtherWindow("down")<CR>a
imap <silent> <M-k> <ESC>:call ScrollOtherWindow("up")<CR>a
imap <silent> <C-j> <ESC>:call ScrollOtherWindow("down")<CR>a
imap <silent> <C-k> <ESC>:call ScrollOtherWindow("up")<CR>a

hi link EasyMotionTarget ErrorMsg

map <Leader>f :FufCoverageFile<CR>
map <Leader>F :FufFile<CR>
map <Leader>b :FufBuffer<CR>
map <Leader>l :FufLine<CR>
