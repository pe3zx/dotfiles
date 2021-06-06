" ===========================================================
" General configuration
" ===========================================================

" Hardcore mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Specify colorscheme here
colorscheme torte

" Enable syntax highlighting
syntax on
filetype plugin indent on
set autoindent
set smartindent

" Show line number
set number

" Tab configuration
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Eliminate all back up and temp files
set nobackup
set noswapfile
set noundofile

" Improve searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Amount of space between lines
set linespace=0

" Set default colorcolumn
set cc=80

" Force using normal backspace
set backspace=indent,eol,start

" Enable key debug
set showcmd

" Autocorrect
command Q q
command W w
command Wq wq
command WQ wq

" Enable wildmenu for auto-completion
set wildmenu
set wildmode=full

" Mute all sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show title and status
set title
set ls=2

" GVim configuration
if has("gui_running")
    set guifont=Hack:h10
    colorscheme slate
	set t_Co=256
	set go-=m
	set go-=T
	set go-=r
	set go-=l
	set go-=b
	set go-=L
endif

" ===========================================================
" Keybindings
" ===========================================================

" Save with ctrl+s
" Add `stty -ixon` to ~/.bashrc or ~/.zshrc first
map <c-s> :up<cr>
imap <c-s> <esc>:up<cr>

" Paste with ctrl+v
exe 'inoremap <script> <C-V> <C-G>u' . paste#paste_cmd['i']
exe 'vnoremap <script> <C-V> ' . paste#paste_cmd['v']

" Esc with ctrl+c
inoremap <C-c> <Esc>
inoremap <C-f> <C-x><C-f>
inoremap <C-l> <C-x><C-l>

" ===========================================================
" Plugins configuration
" ===========================================================

" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'

" ===========================================================
" Filetype configuration
" ===========================================================

" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#
au FileType python setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" Vagrant
augroup vagrant
	au!
	au BufRead,BufNewFile Vagrantfile set filetype=ruby
augroup END

" XML
augroup XML
    autocmd!
    autocmd FileType xml setlocal foldmethod=indent foldlevelstart=999 foldminlines=0
augroup END

function! DoPrettyXML()
  let l:origft = &ft
  set ft=
  1s/<?xml .*?>//e
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  2d
  $d
  silent %<
  1
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()


