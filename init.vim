"" General
set linebreak	" Break lines at word (requires Wrap lines)
set showbreak=+++	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set expandtab	" Use spaces instead of tabs
set shiftwidth=4	" Number of auto-indent spaces
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
set softtabstop=4	" Number of spaces per Tab
 
"" Advanced
set confirm	" Prompt confirmation dialogs
set ruler	" Show row and column ruler information
set scrolloff=5
set hidden
 
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour

call plug#begin()
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'cespare/vim-toml'
call plug#end()

colorscheme gentooish

nnoremap <C-P> :FZF<CR>
