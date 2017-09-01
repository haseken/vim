source $VIMRUNTIME/mswin.vim "windows only

"***** Preparation for using neobundle *****

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Setting Neobundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My bundles here:
" Rfer to |:Neobundle-examples|.

" Write the plugins you want to add
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tomtom/tcomment_vim' "For comments
NeoBundle 'nathanaelkane/vim-indent-guides' "For indents

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck

"-----------------------------
" unite.vim
"-----------------------------
"Display Files list
noremap <C-N> :Unite -buffer-name=file file<CR>
"Display Buffers list
noremap <C-P> :Unite buffer<CR>

"Open split window
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"Open vsplit window
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" Terminate ESC twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


" Display deeply indents 
let g:indent_guides_enable_on_vim_startup=1

"***** Space display of Zenkaku space *****
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', 'Å@')
  augroup END
  call ZenkakuSpace()
endif

"***** Setting *****
set nocompatible "Turn off compatibility with vi
"** Cording
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
source $VIMRUNTIME/delmenu.vim
set langmenu=ja_jp.utf_8
source $VIMRUNTIME/menu.vim
" Font Setting
set guifont=Ricty_Diminished:h14:cSHIFTJIS:qDRAFT

" only windows
set renderoptions=type:directx
set antialias

" printer
set printheader=%<%f%h%m%=%N

set nobackup
set noswapfile
set autoread "If there is change in the file being edited, it will be loaded automatically
set showcmd "Display command being entered
set ruler
set clipboard+=unnamed "Share cipboard
set backspace=indent,eol,start "Active deletion in backspace
set guioptions+=a "put a copy of yank in the clipboard
set wildmenu "Complement with tab in command line mode

"***** Display Setting *****
syntax on
colorscheme koehler
set number "Show line number
set title "Display file name
set showmatch "Highlight the corresponding parenthesis
set tabstop=2 "Set indent for 2 spaces
set expandtab "Insert space instead of tab
set smartindent 
set shiftwidth=2 "Width when deleting
set softtabstop=2 "Space width of ta:b
set cursorline "Emphasize the current line
set laststatus=2 "Show status line

"***** Search Setting *****
set ignorecase "Distinction between uppercase and lowercase letters
set wrapscan "Return to the top when search back to the last line
set hlsearch "Highlight search words
set incsearch "Real time search

"***** Setting for Windows *****
set iminsert=0
set imsearch=-1
set shellslash "Use slashes at path separator for windows

"***** Special *****
"Press Esc twice to remove highlight
nnoremap <Esc><Esc> :nohlsearch<CR><ESC> "Press Esc twice to remove highlight

"***** HTML / XML autocompletion tag *****
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END
