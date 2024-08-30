" init.vim for Python Full-Stack Development

" General settings
set encoding=UTF-8
set number                " Show line numbers
set relativenumber        " Relative line numbers
set tabstop=4             " Number of spaces a tab counts for
set shiftwidth=4          " Number of spaces to use for autoindent
set expandtab             " Convert tabs to spaces
set autoindent            " Copy indent from current line when starting a new line
set smartindent           " Makes indenting smart
set clipboard=unnamedplus " Use system clipboard
set wrap                  " Wrap long lines
set cursorline            " Highlight the current line
set termguicolors         " Enable 24-bit RGB colors
set background=dark       " Set background to dark for color schemes
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype detection, plugin, and indent

" vim-plug setup
call plug#begin('~/.config/nvim/plugged')

" Python development plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'} " coc.nvim for autocompletion, linting, formatting
Plug 'psf/black'                    " Code formatter (Black)
Plug 'tell-k/vim-autopep8'          " AutoPEP8 formatting
Plug 'vim-python/python-syntax'     " Improved Python syntax highlighting
Plug 'mhinz/vim-startify'
Plug 'SirVer/ultisnips'  " UltiSnips plugin
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'preservim/tagbar'
" General development plugins
Plug 'preservim/nerdtree'           " File tree explorer
Plug 'scrooloose/nerdcommenter'     " Easy commenting
Plug 'tpope/vim-fugitive'           " Git integration
Plug 'airblade/vim-gitgutter'       " Git diff in the gutter
Plug 'itchyny/lightline.vim'        " Lightweight status line
Plug 'nvim-tree/nvim-web-devicons'  " Icons for file types
Plug 'scrooloose/nerdcommenter'  " Plugin for commenting code
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-commentary'
Plug 'dense-analysis/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'Mofiqul/vscode.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'  " Optional: Additional themes for vim-airline

Plug 'akinsho/toggleterm.nvim', {'tag': '*'}

" Telescope - Fuzzy Finder
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'  " Required for telescope

" LSP Config
Plug 'neovim/nvim-lspconfig'

" Linting and Formatting
Plug 'jose-elias-alvarez/null-ls.nvim'  " For integration with linters like pylint

call plug#end()


" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Enable vim-devicons globally
let g:webdevicons_enable = 1

" NERDTree configuration
let g:NERDTreeShowHidden=1
let g:NERDTreeShowBookmarks=1
" coc.nvim Configuration
let g:coc_global_extensions = ['coc-pyright']

" Initialize nvim-web-devicons
lua << EOF
require'nvim-web-devicons'.setup { default = true; }
EOF
" Configure ALE to use multiple linters and type checkers for Python
let g:ale_linters = {
\   'python': ['flake8', 'bandit', 'pydocstyle', 'mypy'],
\}

" Enable ALE to fix linting issues on save
let g:ale_fix_on_save = 1

" Configure flake8 settings
let g:ale_python_flake8_executable = 'flake8'
let g:ale_python_flake8_options = ''
let g:ale_python_flake8_options = '--max-line-length=120' " Set max line length to 79 characters
" Configure bandit settings
let g:ale_python_bandit_executable = 'bandit'
let g:ale_python_bandit_options = '-r'

" Configure pydocstyle settings
let g:ale_python_pydocstyle_executable = 'pydocstyle'
let g:ale_python_pydocstyle_options = ''

" Configure mypy settings
let g:ale_python_mypy_executable = 'mypy'
let g:ale_python_mypy_options = '--ignore-missing-imports'

" Configure fixers for Python
let g:ale_fixers = {
\   'python': ['black', 'isort', 'autopep8'],
\}

" Set black and isort as the default fixers
let g:ale_python_black_executable = 'black'
let g:ale_python_black_options = '--line-length 120'

let g:ale_python_isort_executable = 'isort'
let g:ale_python_isort_options = '--profile black'

" Optional: Display linting errors in a floating window
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'
let g:ale_virtualtext_cursor = 'enable'
let g:ale_virtualtext_errors = 1
let g:ale_virtualtext_warnings = 1
" Map Ctrl+R to save and run Python code
nnoremap <C-e> :w<CR>:!python3 %<CR>
inoremap <C-e> <Esc>:w<CR>:!python3 %<CR>

map <F6> :colorscheme gruvbox<CR> 
map <F7> :colorscheme vscode<CR>

" Telescope setup
let g:telescope_defaults = {
\   'file_ignore_patterns': ['node_modules', '.git'],
\ }

" Key mappings for Telescope with Ctrl
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
nnoremap <C-b> :Telescope buffers<CR>
nnoremap <C-h> :Telescope help_tags<CR>

let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'
" Tab Management with Ctrl + Shift
nnoremap <C-S-Right> :tabn<CR>    " Move to the next tab
nnoremap <C-S-Left> :tabp<CR>     " Move to the previous tab
nnoremap <C-S-Up> :tabnew<CR>      " Open a new tab
nnoremap <C-S-Down> :tabc<CR>        " Close the current tab
" Basic UltiSnips configuration
let g:UltiSnipsExpandTrigger="<Tab>"   " Use <Tab> to expand snippets
let g:UltiSnipsJumpForwardTrigger="<C-b>"   " Use Ctrl-b to jump forward in snippet
let g:UltiSnipsJumpBackwardTrigger="<C-z>"   " Use Ctrl-z to jump backward in snippet
" Set custom path for UltiSnips snippets
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']
" Basic configuration for toggleterm.nvim
let g:toggleterm_terminal_mapping = '<C-t>'
let g:toggleterm_size = 20
let g:toggleterm_open_mapping = '<C-\\>'
let g:toggleterm_direction = 'horizontal'
" Load and configure toggleterm.nvim

lua << EOF
require("toggleterm").setup({
  size = 20, -- Size of the terminal window
  open_mapping = [[<C-j>]], -- Key mapping to toggle the terminal
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 2, -- Darker the background
  start_in_insert = true,
  persist_size = true,
  direction = 'horizontal', -- Can be 'horizontal', 'vertical', or 'float'
})
EOF

" Keybindings for ToggleTerm
nnoremap <C-j> :ToggleTerm<CR>
tnoremap <C-j> <C-\><C-n>:ToggleTerm<CR>




"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitbelow
set splitright

" Creating splits with Ctrl + s
nnoremap <F2> :vsplit<cr>  " Vertical split
nnoremap <F3> :split<cr>   " Horizontal split

" Closing splits with Ctrl + s + q
nnoremap <F4> :close<cr>   " Close split

" Map Ctrl + d to delete all content in the buffer
nnoremap <C-d> :%d<CR>

nnoremap <F5> :source ~/.config/nvim/init.vim<CR>

" LSP configuration
" Configure Python LSP (using Pyright as an example)
augroup lsp
  autocmd!
  autocmd FileType python setlocal omnifunc=v:lua.vim.lsp.omnifunc
augroup END

" Null-ls configuration for pylint
" This is more complex in Vimscript, so this example assumes you use a Lua configuration
" Here is an example of Lua configuration you can add to a separate Lua file and source it
" Use: :luafile ~/.config/nvim/lua/null-ls-config.lua

" Undo and Redo Mappings

" Normal Mode
nnoremap <C-z> u         " Undo with Ctrl+Z
nnoremap <C-r> <C-r>    " Redo with Ctrl+R

" Insert Mode
" Insert Mode
inoremap <silent> <C-z> <Esc>ua
inoremap <silent> <C-r> <Esc><C-r>a 
" Visual Mode
xnoremap <C-z> :<C-U>call VisualUndo()<CR> " Undo in Visual Mode
xnoremap <C-r> :<C-U>call VisualRedo()<CR> " Redo in Visual Mode

" Function for Undo in Visual Mode
function! VisualUndo()
    let old_reg = getreg('"')
    let old_sel = &selection
    set selection=exclusive
    let reg = getreg('"')
    execute 'normal! gv"zy'
    let reg = getreg('"')
    let sel = &selection
    set selection=inclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    set selection=exclusive
endfunction

" Function for Redo in Visual Mode
function! VisualRedo()
    let old_reg = getreg('"')
    let old_sel = &selection
    set selection=exclusive
    let reg = getreg('"')
    execute 'normal! gv"zy'
    let reg = getreg('"')
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
    execute 'normal! "zy'
    let sel = &selection
    set selection=exclusive
endfunction




" Single Key Mappings for Moving Between Modes

" Switch to Normal Mode with 'n'
inoremap <C-n> <Esc>
vnoremap <C-n> <Esc> n <Esc>

" Switch to Insert Mode with 'i'
nnoremap i i

" Switch to Visual Mode with 'v'
nnoremap v v

" Optional: To make the transitions smoother
" In Visual Mode, 'i' will switch to Insert Mode
vnoremap i <Esc>i



" Keymaps mimicking VS Code

" Save the current file (Ctrl+S)
function! SaveFile()
    if &buftype == ''
        write
    endif
endfunction

nnoremap <C-s> :call SaveFile()<CR>
inoremap <C-s> <Esc>:call SaveFile()<CR>a

" Run Black formatter (Ctrl+Shift+I)
nnoremap <C-S-i> :Black<CR>
inoremap <C-S-i> <Esc>:Black<CR>a

" Copy the selected text to clipboard (Ctrl+C)
vnoremap <C-c> "+y
nnoremap <C-c> "+yy

" Paste from clipboard (Ctrl+V)
nnoremap <C-v> "+p
vnoremap <C-v> "+p

" Select all text (Ctrl+A)
nnoremap <C-a> ggVG

" Comment/Uncomment code (Ctrl+/)
" Requires nerdcommenter plugin
vnoremap <C-_> :<C-u>call nerdcommenter#Comment(0, "toggle")<CR>
nnoremap <C-_> :<C-u>call nerdcommenter#Comment(0, "toggle")<CR>


" Use <Tab> and <S-Tab> for completion in coc.nvim
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
" Auto format on save using Black or AutoPEP8
autocmd BufWritePre *.py execute ':Black'
" or
" autocmd BufWritePre *.py execute ':Autopep8'

" NERDTree Configuration
nmap <C-b> :NERDTreeToggle<CR>
" Find the current file in NERDTree with Ctrl+f
nmap <C-f> :NERDTreeFind<CR>
" Close NERDTree with Ctrl+c
nmap <C-c> :NERDTreeClose<CR>
" Focus on NERDTree with Ctrl+t
nmap <C-t> :NERDTreeFocus<CR>
" Lightline Status Line Configuration
set background=dark    " Set background to dark mode
colorscheme vscode    " Set colorscheme to Gruvbox
" Git Integration
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gc :Gcommit<CR>
nmap <Leader>gp :Gpush<CR>
nmap <Leader>gl :Gpull<CR>

" Python virtual environment
let g:python3_host_prog = '~/.virtualenvs/neovim3/bin/python'
