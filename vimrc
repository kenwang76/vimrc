"
"General settings
"

set nocompatible

" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings.
filetype plugin indent on
syntax on

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

""" Formatting {{{
  " Set the default tabstop
  set tabstop=4
  set softtabstop=4
  " Set the default shift width for indents
  set shiftwidth=4
  " Make tabs into spaces (set by tabstop)
  set expandtab
  " Smarter tab levels
  set smarttab
  " Copy indent from current line when starting a new line
  set autoindent
  " Do smart autoindenting when starting a new line
  set smartindent
""" }}}

" various settings
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one
                               " unsaved buffers.
set incsearch                  " Incremental search, hit '<CR>' to stop.
set ruler                      " Shows the current line number at the bottom.
                               " right of the screen.
set wildmenu                   " Great command-line completion, use '<Tab>' to
                               " move around and '<CR>' to validate.
set number                     " Show line number
set nowrap

"
" Key mapping
"

"Switch between different windows by their direction
no <C-j> <C-w>j "switching to below window
no <C-k> <C-w>k "switching to above window
no <C-l> <C-w>l "switching to right window
no <C-h> <C-w>h "switching to left window

"
" Plugins
"

" Automatically install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Apprearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

""Plugin Airline {{{
    let g:airline_theme='tomorrow'
""}}}


"" Plugin: Vim Better Whitespace {{{
    " All trailing whitespace characters to be highlighted
    Plug 'ntpeters/vim-better-whitespace'
    " Disable this plugin for specific file types
    let g:better_whitespace_filetypes_blacklist=[
    \ 'diff', 'gitcommit', 'unite', 'qf', 'help', 'nerdtree'
    \ ]
    " Strip all trailing whitespace everytime save the file
    autocmd BufWritePre * StripWhitespace
"" }}}

"" Plugin: CtrlP {{{
      " Full path fuzzy file, buffer, mru, tag finder for Vim
      Plug 'ctrlpvim/ctrlp.vim'
      " Change default mapping
      let g:ctrlp_map='<c-p>'
      " Change default command
      let g:ctrlp_cmd='CtrlP'
"" }}}

"" Plugin: NERDTree {{{
    " Explore filesystem with Vim
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeTabsToggle'] }
    " Ignore some extensions
    let NERDTreeIgnore=['.o$','.pyc$']
    " Show hidden files
    let NERDTreeShowHidden=1
"" }}}

"" Plugin: NERDTree Git Plugin {{{
  " A plugin of NERDTree showing git status flags
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Use this variable to change symbols
  let g:NERDTreeIndicatorMapCustom = {
  \ 'Modified'  : '*',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Deleted'   : '✖',
  \ 'Dirty'     : '✗',
  \ 'Clean'     : '✔︎',
  \ 'Unknown'   : '?'
  \ }
"" }}}

"" Theme: Molokai {{{
    Plug 'tomasr/molokai'
    " Match the original monokai background color
    let g:molokai_original=1
    " Bring the 256 color version
    let g:rehash256=1
"" }}}

"" Theme: Solarized {{{
    Plug 'altercation/vim-colors-solarized'
"" }}}
call plug#end()

"" Theme
set t_Co=256
colorscheme molokai
