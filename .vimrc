set nocompatible
set backspace=indent,eol,start
map Q gq
inoremap <C-U> <C-G>u<C-U>
"if has('mouse')
"	set mouse=a
"endif
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
filetype indent on
set shortmess=atI
set nu
set tabstop=4
set softtabstop=4
set shiftwidth=4
set whichwrap=b,s,<,>,[,]
set complete=.,w,b,u,t,i
set hidden
"set rnu
set nocp
"noremap <F12> :w<cr>
"inoremap <F12> <ESC>:w<cr>
"noremap <F9> :Break<cr>
"inoremap <F9> <ESC>:Break<cr>
map <pageUp> <C-w>W
map <pagedown> <c-w>w
inoremap <pageUp> <ESC><c-w>W
inoremap <pageDown> <ESC><c-w>w
noremap <s-up> :res +1<cr>
noremap <s-down> :res -1<cr>
noremap <s-left> :vertical resize -1<cr>
noremap <s-right> :vertical resize +1<cr>
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
function! s:setSch()
	let w:isWritingSch = exists('w:isWritingSch')? !w:isWritingSch : 1
	if w:isWritingSch==1
		vertical let s:term_name=bufname(term_start("scheme"))
		noremap <C-t> %va("+y
	else
		unmap <C-t>
		execute 'bd! ' . s:term_name
	endif
	echo "Success."
endfunction
command WriteSch :call <SID>setSch()
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
"Plugin 'kovisoft/slimv
Plugin 'puremourning/vimspector'
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
set background=dark
let g:indent_guides_enable_on_vim_startup=1
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:airline#extensions#tabline#enabled = 0
let g:airline#extension#tabline_sep=' '
let g:airline#extension#tabline_alt_sep='|'
let g:airline#extension#tabline#clock#format='%H:%M:%S'
let g:airline#extensions#default#layout = [
      \ [ 'a', 'b', 'c' ],
      \ [ 'x', 'y', 'z' , 'error' ]
      \ ]
let g:airline_skip_empty_sections = 1
let g:airline_theme='luna'
set laststatus=2
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
let g:rainbow_active = 1
set ruler
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
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
let g:vimspector_enable_mappings = 'HUMAN'
nmap <F7> <Plug>VimspectorContinue
nmap <leader><F12> <Plug>VimspectorStepInto
nmap <leader><F6> <Plug>VimspectorRestart
nmap <leader><F7> <Plug>VimspectorStop
set showcmd
au BufRead,BufNewFile *.fkl set filetype=scheme | set expandtab | retab | RainbowParenthesesToggle
au BufRead,BufNewFile *.txt RainbowParenthesesToggle
set list
set listchars=trail:#
