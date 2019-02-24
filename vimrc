set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'
" Haptik
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'fatih/vim-go'

" Syntax
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'

" Optik
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" Files
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" Search
Plugin 'kien/ctrlp.vim'

" Statusbar
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set encoding=utf-8

let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"custom keys
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g :YcmCompleter GoToDefinition<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Line Numbering
set nu

" Python
"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h,*.txt,*.go set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.c,*.py,*.pyw,*.yml,*.txt,*.go set shiftwidth=4
au BufRead,BufNewFile *.c,*.py,*.pyw,*.yml,*.txt set expandtab
au BufRead,BufNewFile *.c,*.py,*.yml,*.txt,*.go set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

let python_highlight_all=1
syntax on
let g:ycm_python_binary_path = 'python'

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" Optik
if has('gui_running')
  set guifont=Noto\ Mono\ 14
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif

call togglebg#map("<F5>")

" Frontend
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
    \ set expandtab

" required for latex-suite
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
