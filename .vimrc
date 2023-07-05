"=======================================================================================================
"
"				_____/\\\\\\\\\\\____/\\\________/\\\_
"				 ___/\\\/////////\\\_\/\\\_______\/\\\_
"				  __\//\\\______\///__\/\\\_______\/\\\_
"				   ___\////\\\_________\/\\\\\\\\\\\\\\\_
"				    ______\////\\\______\/\\\/////////\\\_
"				     _________\////\\\___\/\\\_______\/\\\_
"				      __/\\\______\//\\\__\/\\\_______\/\\\_
"				       _\///\\\\\\\\\\\/___\/\\\_______\/\\\_
"					___\///////////_____\///________\///__
"						
"						Author:- SPANDAN HALDER
"=======================================================================================================
" Editor Options --->
" Basic Options
set rnu
set belloff=all
set clipboard=unnamedplus
syntax on
set autoindent
set smartindent
set showmatch
set ignorecase
set smartcase
set incsearch
set backspace=indent,eol,start
set encoding=utf-8
set fileencoding=utf-8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"	" Colour in Terminal
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
noremap <silent> <C-S-i> :set guifont=* <CR> " Font Selector
noremap <silent> <S-j> :bp <CR> " Previous buffer
noremap <silent> <S-k> :bn <CR> " Next Buffer
noremap <silent> <S-h> :tabp <CR> " Previous tab
noremap <silent> <S-l> :tabn <CR> " Next tab
au! BufWritePost $MYVIMRC source % " Auto source config
if has("win32")
	let &pythonthreedll=$USERPROFILE."/anaconda3/python39.dll"
	let &pythonthreehome=$USERPROFILE."/anaconda3"	
endif
if has("gui_running")
    set guioptions -=m " Menubar
    set guioptions -=T " Toolbar
    set guioptions -=r " Scrollbar
    set guioptions -=L " Scrollbar    	
endif
if (has("gui_running") && has("unix"))
	set guifont=JetBrainsMono\ Nerd\ Font\ 12 " Font (Unix GVim Only)
endif
if (has("gui_running") && has("win32"))
	" Font (Windows GVim Only)
	set guifont=LiterationMono_NF:h12 
	" Auto Compile and Execute
	autocmd FileType python map <buffer> <F5> :w<CR>:exec '!py' '-3' '%'<CR>
	autocmd FileType cpp map <buffer> <F5> :w<CR>:exec '!g++' '-std=c++17' '-o' '%:r' '%' '&&' '%:r'<CR>
	" For input file (C++)
	autocmd FileType cpp map <buffer> <S-F5> :w<CR>:exec '!g++' '-std=c++17' '-o' '%:r' '%' '&&' '%:r' '<' 'INPUT.txt'<CR>
	autocmd FileType c map <buffer> <F5> :w<CR>:exec '!gcc'  '-o' '%:r'  '%' '&&' '%:r'<CR>
	autocmd FileType javascript map <buffer> <F5> :w<CR>:exec '!node' '%'<CR>
	autocmd FileType go map <buffer> <F5> :w<CR>:exec '!go run' '%'<CR>
	autocmd FileType dart map <buffer> <F5> :w<CR>:exec '!dart' '%'<CR>
	autocmd filetype java nnoremap <F5> :w <BAR> !javac % && java %:r <CR>
endif
"=======================================================================================================
" Plugins --->
call plug#begin('~/.vim/plugged')
Plug 'luochen1990/rainbow'							" Rainbow brackets
Plug 'raimondi/delimitmate'							" Delimate
Plug 'preservim/nerdtree'							" NerdTree
Plug 'w0ng/vim-hybrid'								" Theme (Vim Hybrid)
Plug 'kuuote/elly.vim'								" Theme (Elly)
Plug 'arcticicestudio/nord-vim'							" Theme (Nord)
Plug 'yggdroot/indentline'							" IndemtLine
Plug 'ryanoasis/vim-devicons'							" Vim Devicons
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }	" Markdown Preview
Plug 'vim-airline/vim-airline'							" Airline
Plug 'vim-airline/vim-airline-themes'						" Airline Themes
Plug 'SirVer/ultisnips'								" Snippets (UltiSnip)
call plug#end()
"======================================================================================================
" Plugin Specific
" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='elly'
" Colorscheme
colorscheme elly
set termguicolors
" Rainbow Parentheses
let g:rainbow_active = 1
" DelimitMate
let b:delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1
" (Shift + Tab) to toggle NerdTree
noremap <silent> <S-Tab> :NERDTreeToggle <CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
" UltiSnips Configuration
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:UltiSnipsSnippetDirectories=[$HOME.'/vimrc/snippets']
