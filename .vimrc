set nocompatible
set term=screen-256color
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set mouse=a
syntax on

Plugin 'Buffergator'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'joshdick/onedark.vim'
Plugin 'w0ng/vim-hybrid'
Plugin 'ap/vim-css-color'
Plugin 'gmarik/vundle'
Plugin 'nvie/vim-flake8'
Plugin 'rdnetto/YCM-Generator'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/syntastic'
" Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'

" Now we can turn our filetype functionality back on
filetype plugin indent on

" vim airline config
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline_theme='tomorrow'

" NERDTree settings
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1 " Let YCM read tags from Ctags file
let g:ycm_use_ultisnips_completer = 1 " Default 1, just ensure
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
" let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:ycm_filetype_blacklist = { 'C': 1 }
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0

map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntastic settings
let g:syntastic_cpp_compiler_options = ' -std=c++11'

" ----------------
"  C/C++ settings
" ----------------

au BufNewFile,BufRead *.cpp,*.h,*.c,*.C,*.hpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" ----------------
"  Python settings
" ----------------

" Python Intdent (Pep-8)
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" Flaf unnecessary whitespace for Python
" define BadWhitespace before using in a match
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"
" Ros launch
"
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch

" ----------------
" general settings
" ----------------
:let mapleader = ","
nnoremap <Leader>w :w<CR>
nmap <Leader>o  o<Esc>k
nmap <Leader>O  O<Esc>j

syntax on
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
set background=dark
colorscheme hybrid

" UTF-8 Support
set encoding=utf-8

" enable linenumbering
set nu

" System clipboard
set clipboard=unnamed

" Navigating through the windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set splitbelow
set splitright

" searching option
set ignorecase
set smartcase

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" this enables "visual" wrapping
set wrap

 " this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" change paranthis matching color
hi MatchParen cterm=bold ctermbg=none ctermfg=red

" Spelling
nmap <F5> :setlocal spell spelllang=en_us<CR>
nmap <F6> :set nospell<CR>

autocmd BufRead,BufNewFile *.md,*.tex setlocal spell spelllang=en_us
autocmd FileType gitcommit setlocal spell
set complete+=kspell

" Removes trailing spaces
function TrimWhiteSpace()
  %s/\s*$//
  ''
endfunction

set list listchars=trail:.,extends:>
autocmd FileWritePre * call TrimWhiteSpace()
autocmd FileAppendPre * call TrimWhiteSpace()
autocmd FilterWritePre * call TrimWhiteSpace()
autocmd BufWritePre * call TrimWhiteSpace()

map <F2> :call TrimWhiteSpace()<CR>
map! <F2> :call TrimWhiteSpace()<CR>

" show traling spaces
"set list listchars=tab:»·,trail:·
