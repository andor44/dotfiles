"" General
set linebreak           " Break lines at word (requires Wrap lines)
set showbreak=+++       " Wrap-broken line prefix
set textwidth=0         " Line wrap (number of cols)
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
set tabstop=4
set list
set number

"" Advanced
set confirm             " Prompt confirmation dialogs
set ruler               " Show row and column ruler information
set scrolloff=5         " Pre-scroll buffer 5 lines ahead of cursor
set hidden              " Hide buffers when opening new ones
set undofile
set undodir=~/.vim/undodir
set undolevels=1000               " Number of undo levels
set backspace=indent,eol,start    " Backspace behaviour

set clipboard=unnamedplus         " copy to X clipboard on Linux

call plug#begin()
" rust-mode
Plug 'rust-lang/rust.vim'
" syntax checker
"Plug 'w0rp/ale'
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
" Shortcuts
Plug 'tpope/vim-unimpaired'
" Commenting
Plug 'tpope/vim-commentary'
" Terraform
Plug 'hashivim/vim-terraform'
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Crystal
Plug 'vim-crystal/vim-crystal'
" GraphQL support
Plug 'jparise/vim-graphql'

"" RUST SHIT
" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" plugin configs
" lightline color scheme
let g:lightline = { 'colorscheme': 'seoul256', }
colorscheme wombat256

" activate rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" FZF shortcuts
nnoremap <C-P> :FZF<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <C-F> :Lines<CR>

" ALE settings
"" Do not run checkers on changing buffer
"let g:ale_lint_on_text_changed = 'never'
"" Do not run checkers upon entering buffer
"let g:ale_lint_on_enter = 0
"let g:ale_linters = {'rust': ['analyzer']}
"let g:ale_completion_enabled = 1
"set omnifunc=ale#completion#OmniFunc
"" Open loclist after checks run
""let g:ale_open_list = 1

" file type specific commands
" Markdown should autowrap at 100 columns
autocmd bufreadpre *.md setlocal textwidth=100

set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF
