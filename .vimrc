set nocompatible
set backspace=indent,eol,start
map Q gq
inoremap <C-U> <C-G>u<C-U>
if has('mouse')
	set mouse=a
endif
if has("vms")
	set nobackup
else
	set backup
	set undofile
endif
set backupdir=~/.vim/backup
set undodir=~/.undodir
set history=50
set ruler
set showcmd
set incsearch
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif
if has("autocmd")
	filetype plugin indent on
	augroup vimrcEx
	au!
	autocmd FileType text setlocal textwidth=78
	autocmd BufReadPost *
		\ if line("'\"")>=1 && line("'\"") <=line("$") | exe "normal! g`\"" |
		\ endif
	augroup END
else
	set autoindent
endif
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
if has('langmap') && exists('+langnoremap')
	set langnoremap
endif
set fileencodings=usc-bom,utf-8,cp936,gb2312
set autoindent
set cindent
set shortmess=atI
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set whichwrap=b,s,<,>,[,]
set complete=.,w,b,u,t,i
set hidden
set rnu
set nocp
noremap <F12> :w<cr>
inoremap <F12> <ESC>:w<cr>
noremap <F9> :Break<cr>
inoremap <F9> <ESC>:Break<cr>
map <pageUp> <C-w>W
map <pagedown> <c-w>w
inoremap <pageUp> <ESC><c-w>W
inoremap <pageDown> <ESC><c-w>w
syntax on
packadd termdebug
set cursorcolumn
set cursorline
highlight CursorLine cterm=NONE ctermbg=238 ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=238 ctermfg=NONE guibg=NONE guifg=NONE
highlight LineNr ctermfg=grey
highlight CursorLineNr ctermbg=grey ctermfg=black
xnoremap * :<C-u>call <SID>VSetSearch('/')<cr>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VsetSearch('?')<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch(cmdtype)
	let temp=@s
	norm! gv"sy
	let @/='\V' . substitute(escape(@s,a:cmdtype.'\'),'\n','\\n','g')
	let @s=temp
endfunction
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'morhetz/gruvbox'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'enricobacis/vim-airline-clock'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'kovisoft/slimv'
"Plugin 'puremourning/vimspector'
Plugin 'humiaozuzu/fcitx-status'
"Plugin 'iamcco/mathjax-support-for-mkdp'
"Plugin 'iamcco/markdown-preview.vim'
"Plugin 'frazrepo/vim-rainbow'
"Plugin 'luochen1990/rainbow'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on
let g:NERDSpaceDelims=1
map <C-n> :NERDTreeToggle<cr>
map <c-w><c-f> :FirstExplorerWindow<cr>
map <c-w><c-b> :BottomExplorerWindow<cr>
map <c-w><c-t> :WMToggle<cr>
nmap <F8> :TagbarToggle<CR>
set laststatus=2
set background=dark
let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:airline#extensions#tabline#enabled = 0
let g:airline#extension#tabline_sep=' '
let g:airline#extension#tabline_alt_sep='|'
let g:airline#extension#tabline#clock#format='%H:%M:%S'
let g:airline_theme='minimalist'
let g:rainbow_active = 1
set ruler
"colorscheme gruvbox
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
" \ ['darkcyan',    'SeaGreen3'],
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
