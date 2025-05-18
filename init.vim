set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set showcmd                 " show partial command in status line
set ignorecase              " case insensitive 
" set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set relativenumber
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
" set wildmode=longest,list   " get bash-like tab completions
set cc=120                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
set backupdir=~/.vim_backups
set splitright             " open new split windows to the right
set autochdir              " change cwd to current open file

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" call plug#begin()
" 
" " List your plugins here
" Plug 'tpope/vim-sensible'
" Plug 'preservim/nerdtree'
" Plug 'preservim/nerdcommenter'
" Plug 'tpope/vim-surround'
" Plug 'khairihafsham/Wombat'
" Plug 'ervandew/supertab'
" Plug 'kien/ctrlp.vim'
" 
" " fugitive
" Plug 'tpope/vim-fugitive'
" 
" " C# LSP?
" Plug 'seblyng/roslyn.nvim'
" 
" Plug 'ionide/Ionide-vim'
" 
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
" Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
" Plug 'hrsh7th/cmp-path', { 'branch': 'main' }
" Plug 'hrsh7th/cmp-cmdline', { 'branch': 'main' }
" Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }
" Plug 'hrsh7th/cmp-vsnip', { 'branch': 'main' }
" Plug 'hrsh7th/vim-vsnip'
" 
" " for snippets
" Plug 'honza/vim-snippets'
" 
" call plug#end()
:lua require("config.lazy")

" Function to setup fsharp autocomplete from ionide-vim
function! s:fsharp()
  " Required: to be used with nvim-cmp.
  let g:fsharp#lsp_auto_setup = 0

  " Recommended: show tooptip when you hold cursor over something for 1 second.
  " if has('nvim') && exists('*nvim_open_win')
  "   set updatetime=1000
  "   augroup FSharpShowTooltip
  "     autocmd!
  "     autocmd CursorHold *.fs,*.fsi,*.fsx call fsharp#showTooltip()
  "   augroup END
  " endif

  " Recommended: Paket files are excluded from the project loader.
  let g:fsharp#exclude_project_directories = ['paket-files']
endfunction

colorscheme dracula 

let g:NERDTreeWinSize=40

call s:fsharp()
" :lua require("nvim-cmp")
" :lua require("nvim-lsp")
