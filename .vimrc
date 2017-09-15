set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" " File explorer
Plugin 'scrooloose/nerdtree'
" " Airline (status bar)
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" " Easy commenting out
Plugin 'tpope/vim-commentary'
" " Color schemes
Plugin 'chriskempson/base16-vim'
Plugin 'flazz/vim-colorschemes'
" " Tag highlighting
Plugin 'vim-scripts/TagHighlight'
" " Tag listing
Plugin 'majutsushi/tagbar'
" " Autocompletion
Plugin 'Valloric/YouCompleteMe'
" " Syntax error reporting
Plugin 'scrooloose/syntastic'
" " Close parenthesis, brackets, etc
Plugin 'jiangmiao/auto-pairs'
" " Multiple cursor selection
Plugin 'terryma/vim-multiple-cursors'
" " Smooth scrolling
Plugin 'terryma/vim-smooth-scroll'
" " Documentation
Plugin 'KabbAmine/zeavim.vim'
" " Language-specific {{{
Plugin 'octol/vim-cpp-enhanced-highlight',{'for': 'cpp'}
Plugin 'davidhalter/jedi-vim',            " Python
Plugin 'lervag/vimtex',                   " Latex
" " }}}

call vundle#end()            " required
filetype plugin indent on    " required

" Leader {{{

let mapleader="\<Space>"
let maplocalleader="\<Space>"

" }}}

" UI options {{{
if has('gui_running')
  "set guifont=Fira\ Mono\ Regular\ 13
  set guifont=Hack\ 13
  set linespace=2

  " Remove scrollbars
  set guioptions-=L
  set guioptions-=R
  set guioptions-=T
  set guioptions-=B

  " Remove toolbar
  set guioptions=-t

  " Default size
  set lines=40 columns=130
else
  noremap <silent> <ScrollWheelUp> :call smooth_scroll#up(&scroll/3, 0, 2)<CR>
  noremap <silent> <ScrollWheelDown> :call smooth_scroll#down(&scroll/3, 0, 2)<CR>
endif
" }}}

" Plugin settings {{{

" NERDTree
nnoremap <Leader>h :NERDTreeToggle<esc>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore = ['\.pyc$', '\.hi', '\.o', '\.pdf', '\.taghl', '.ycm_extra_conf.py']
let NERDTreeShowHidden=1


" Airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'lucius'

" Syntastic
nnoremap <F4> :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = '-std=c++11'
let g:syntastic_error_symbol = ">>"
let g:syntastic_python_checkers=['pylint', 'python']
let g:syntastic_python_pylint_args = '--rcfile=~/pio_home/pylint.cfg'

" Tagbar
" nnoremap <silent> <leader>l :TagbarToggle<CR>

" Cscope
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
"nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>

" YouCompleteMe
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <silent> <leader>g :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>f :YcmCompleter FixIt<CR>
nnoremap <silent> <leader>d :YcmCompleter GetDoc<CR>
" Go back to previous location with <leader>b
nnoremap <leader>b <C-o>
" Do not ask when starting vim
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
set tags+=./.tags
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_goto_buffer_command = 'vertical-split'
" add some bindings
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']

" VimTeX
let g:vimtex_view_general_viewer = 'qpdfview'
let g:vimtex_view_general_options
  \ = '--unique @pdf\#src:@tex:@line:@col'
let g:vimtex_view_general_options_latexmk = '--unique'
let g:tex_flavor = "latex"
" }}}

" General options {{{
set number
set ruler
syntax on
filetype plugin indent on
set autoindent
set smartindent
set encoding=utf-8
set backspace=indent,eol,start
set modelines=0
set laststatus=2
set showcmd
if v:version > 703
  set undofile
  set undoreload=10000
  set undodir=~/.vim/tmp/undo/     " undo files
endif
set splitright
set splitbelow
set autoread " auto reload file on change
set mouse=a
set scrolloff=8 "keep 8 lines below/above cursor
" }}}

" Colorscheme {{{
set t_Co=256
let base16colorspace=256
set background=dark
colorscheme iceberg
"syntax enable

" Some extra highlighting
:highlight Search ctermbg=None ctermfg=12

:highlight LineNr ctermbg=black ctermfg=gray guifg=gray

" }}}

" Wrapping {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list
set listchars=tab:\ \ ,trail:·

function! s:setupWrapping()
  setlocal wrap
  setlocal wrapmargin=2
  setlocal textwidth=160
  if v:version > 703
    setlocal colorcolumn=+1
  endif
endfunction

" }}}

" Searching and movement {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" }}}

" Change paranthis matching color {{{
 hi MatchParen cterm=bold ctermbg=none ctermfg=none
" }}}

" Backups and undo {{{
set backupdir=~/.vim/tmp/backup/ " backups
set directory=~/.vim/tmp/swap/   " swap files
set backup                       " enable backups
set backupskip=/tmp/*,/private/tmp/*"
" }}}

" Filetype specific {{{
" C {{{
augroup c_lang
  au!
  au Filetype cpp setlocal ts=4 sw=4 sts=4
  au Filetype c setlocal ts=4 sw=4 sts=4
  au FileType c setlocal cms=//\ %s
  au FileType cpp setlocal cms=//\ %s
  au FileType cpp setlocal foldmethod=syntax foldlevel=20
  au FileType c setlocal foldmethod=syntax foldlevel=20
augroup END
" }}}
" HTML {{{
  au BufRead *.html setlocal ts=2 sw=2 sts=2
  au BufRead *.html set ft=html
" }}}
" Markdown {{{
augroup ft_markdown
  au!
  au BufNewFile,BufRead *.m*down setlocal filetype=markdown
  au BufNewFile,BufRead *.md setlocal filetype=markdown
  au Filetype markdown call s:setupWrapping()

  " Use <localleader>1/2/3 to add headings.
  au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
  au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
  au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END
" }}}
" Python {{{
augroup ft_python
  au!
  au BufRead,BufNewFile
      \ set tabstop=4
      \ set softtabstop=4
      \ set shiftwidth=4
      \ set textwidth=79
      \ set expandtab
      \ set autoindent
      \ set fileformat=unix
augroup END
" }}}
" }}}

" Mappings {{{
nnoremap <silent> <C-l> :noh<CR><C-L>
" edit and source vimrc easily
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<cr>

" rewrite file with sudo
cmap w!! w !sudo tee % >/dev/null
nnoremap _md :set ft=markdown<CR>
" Allow copy-pasting to X11 in visual mode
vnoremap <C-c> "+y
" }}}
" Tab completion for commands {{{
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
" }}}
" some autocommands {{{
augroup unrelated_au
  au!

  " function to remove trailing whitespace without moving to it
  function! s:removeTrailingWhitespace()
    normal! ma
    :%s/\s\+$//e
    normal! `a
  endfunction

  " Remove trailing whitespace
  autocmd BufWritePre * :call s:removeTrailingWhitespace()

augroup END
"}}}
" Relative number toggle {{{
function! ToggleNumberRel()
  if &relativenumber
    setlocal norelativenumber
  else
    setlocal relativenumber
  endif
endfunction

" Quickly toggle between relativenumber and number
noremap <leader>rr :call ToggleNumberRel()<CR>
" }}}
" for some reason vim searches for something
:noh
