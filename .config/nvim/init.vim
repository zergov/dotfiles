set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set nobackup
set nowb
set noswapfile

source ~/.config/nvim/plugins.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	  Defaults Tabs and indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nowrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   look and feel
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set termguicolors
set background=dark
set relativenumber
set number
set hidden
set nocursorline
set noshowmode
colorscheme gruvbox

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Copy and paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("clipboard")
  set clipboard=unnamed " copy to system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Mappings & commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"

:command Notes :e ~/notes
:command Nvimconf :e ~/.config/nvim/init.vim
:command Nvimplugins :e ~/.config/nvim/plugins.vim

" Clear highlight on CR
nnoremap <CR> :nohlsearch<CR><CR>

" Space + s to save current file
nmap <leader>s :w<cr>

" NERDTree remap
nnoremap <leader>nf :NERDTreeFind<CR>

" Plugin mapping
cnoreabbrev Ack Ack!
nnoremap <Leader>f :Ack!<Space>

" resize vertical splits
nnoremap <silent> <Leader>= :exe "vertical resize +30"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -30"<CR>

function SetLSPShortcuts()
  nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
  nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
  nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
  nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
  nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
  nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
  nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
  nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
  nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
  nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
endfunction()

" LanguageClient-neovim shortcuts (only enabled on supported filetypes)
augroup LSP
  autocmd!
  autocmd FileType ruby,typescript,typescriptreact call SetLSPShortcuts()
augroup END

autocmd BufWritePre * %s/\s\+$//e " Clean trailling white spaces on save

function BootstrapSpin()
  :PlugInstall
  :qa
endfunction()
