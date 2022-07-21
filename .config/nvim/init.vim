call plug#begin()
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'joshdick/onedark.vim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

syntax on
colorscheme onedark
set exrc " load local rc from folder
set tabstop=4 
set softtabstop=4
set expandtab
set shiftwidth=4
set relativenumber
set nu " show current line number
set hidden
set nohlsearch
set noerrorbells
set nowrap
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
let mapleader= " " 


nnoremap <leader>f <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ sorting_strategy="ascending" })<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


nnoremap <leader>y "+y
vnoremap <leader>y "+y
nmap <leader>Y "+Y

nnoremap <leader>p "+p
vnoremap <leader>p "+p

nnoremap <leader>d "_d
vnoremap <leader>d "_d

lua <<EOF
local on_attach = function()
                    
end
require'lspconfig'.gopls.setup{ on_attach = on_attach, cmd={os.getenv("HOME") .. "/go/bin/gopls"} }
require'lspconfig'.tsserver.setup {}
require'lspconfig'.angularls.setup {}
EOF
