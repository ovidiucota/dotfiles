" ========================================================================
" " Vundle stuff
" " ========================================================================
set nocompatible " Required by vundle
filetype off     " Required by vundle

" " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'kchmck/vim-coffee-script'
Plugin 'skwp/greplace.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'digitaltoad/vim-pug'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ngmy/vim-rubocop'
Plugin 'takac/vim-hardtime'

" Colors
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set showmatch
set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set guifont=Triskweline_10:h10
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set relativenumber
set number
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent " always set autoindenting on
set lazyredraw " Don't redraw screen when running macros.

" always show file name
set modeline
set ls=2

highlight ColorColumn ctermbg=red
set colorcolumn=80

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

colorscheme jellybeans

" Set gutter background to black
highlight SignColumn ctermbg=black
" Display extra whitespace
set list listchars=tab:»·,trail:·

" Enable built-in matchit plugin
runtime macros/matchit.vim
" ================

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" =========== CUSTOM

autocmd vimenter * NERDTree
let g:ackprg = 'ag --nogroup --nocolor --column'
let g:vimrubocop_keymap = 0
let g:hardtime_default_on = 1

let mapleader = ","

imap jj <esc>
map <Leader>ac :sp app/controllers/application_controller.rb<cr>
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
vmap <Leader>bed "td?describe<cr>obed<tab><esc>"tpkdd/end<cr>o<esc>:nohl<cr>
map <Leader>cc :!cucumber --drb %<CR>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co mmggVG"*y`m
map <Leader>cc :Rjcollection client/
map <Leader>cj :Rjspec client/
map <Leader>cm :Rjmodel client/
map <Leader>cs :call SearchForCallSitesCursor()<CR>
map <Leader>ct :Rtemplate client/
map <Leader>cv :Rjview client/
map <Leader>cn :e ~/Dropbox/notes/coding-notes.txt<cr>
map <Leader>d orequire 'pry'<cr>binding.pry<esc>:w<cr>
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>dj :e ~/Dropbox/notes/debugging_journal.txt<cr>
map <Leader>ec :e ~/code/
map <Leader>gw :cd %:p:h<cr>:!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>gl :e Gemfile.lock<cr>
map <Leader>f :call OpenFactoryFile()<CR>
map <Leader>fix :cnoremap % %<CR>
map <Leader>fa :sp spec/factories.rb<CR>
map <Leader>i mmgg=G`m
map <Leader>l :Eval<cr>
map <Leader>m :Rmodel
map <Leader>mf mmgqap`m:w<cr>
map <Leader>nn :sp ~/Dropbox/notes/programming_notes.txt<cr>
map <Leader>nt :e! ~/Dropbox/docs/trailmix/todo.md<cr>
map <Leader>o :w<cr>:call RunNearestSpec()<CR>
map <Leader>p :set paste<CR><esc>"*]p:set nopaste<cr>
map <Leader>pn :sp ~/Dropbox/work/tuple/project-notes.md<cr>
map <Leader>q :copen<cr><cr>
nmap <Leader>r :RuboCop<CR>
map <Leader>ra :%s/
map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>rt q:?!ruby<cr><cr>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sg :sp<cr>:grep<space>
map <Leader>sm :RSmodel
map <Leader>sp yss<p>
map <Leader>sn :e ~/.vim/snippets/ruby.snippets<CR>
map <Leader>so :so %<cr>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest
map <Leader>sv :RSview
map <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
map <Leader>y :!rspec --drb %<cr>
map <Leader>u :Runittest<cr>
map <Leader>vc :Vcontroller<cr>
map <Leader>vf :Vfunctional<cr>
map <Leader>vg :vsp<cr>:grep
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vu :AV<CR>
map <Leader>vm :Vmodel<cr>
map <Leader>vv :Vview<cr>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

map <C-h> :nohl<cr>
" Note that remapping C-s requires flow control to be disabled
" (e.g. in .bashrc or .zshrc)
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :NERDTreeToggle<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Quickfix management
map <Space><Space> :ccl<cr>

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e
command! W w
command! Wq wq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
