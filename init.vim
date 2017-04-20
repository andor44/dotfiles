"" General
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=100       " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set visualbell          " Use visual bell (no beeping)
 
set hlsearch            " Highlight all search results
set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive
set incsearch           " Searches for strings incrementally
 
set autoindent          " Auto-indent new lines
set expandtab           " Use spaces instead of tabs
set shiftwidth=4        " Number of auto-indent spaces
set smartindent         " Enable smart-indent
set smarttab            " Enable smart-tabs
set softtabstop=4       " Number of spaces per Tab
 
"" Advanced
set confirm             " Prompt confirmation dialogs
set ruler               " Show row and column ruler information
set scrolloff=5         " Pre-scroll buffer 5 lines ahead of cursor
set hidden              " Hide buffers when opening new ones
 
 
set undolevels=1000               " Number of undo levels
set backspace=indent,eol,start    " Backspace behaviour

set clipboard=unnamedplus         " copy to X clipboard on Linux

call plug#begin()
" rust-mode from patched repo for cargo checker
" TODO: go back to OG rust repo
Plug 'jlevesy/rust.vim'
" syntax checker
Plug 'scrooloose/syntastic'
" tab completion
Plug 'ervandew/supertab'
" bunch of color schemes
Plug 'flazz/vim-colorschemes'
" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" TOML file mode
Plug 'cespare/vim-toml'
" colorscheme
Plug 'junegunn/seoul256.vim'
" statusline
Plug 'itchyny/lightline.vim'
" Colorize parentheses
Plug 'kien/rainbow_parentheses.vim'
" respect editorconfigs
Plug 'editorconfig/editorconfig-vim'
" git stuff
Plug 'tpope/vim-fugitive'
" respect file's/project's tab/spaces convention
Plug 'tpope/vim-sleuth'
" puppet syntax highlight
Plug 'rodjek/vim-puppet'
" update those damn serials
Plug 'seveas/bind.vim'
call plug#end()

set background=dark
colorscheme seoul256

" plugin configs
" lightline color scheme
let g:lightline = { 'colorscheme': 'seoul256', }

" activate rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

nnoremap <C-P> :FZF<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <C-F> :Lines<CR>

let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_check_on_open = 1
