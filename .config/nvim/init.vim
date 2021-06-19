set nocompatible
set shell=/bin/bash
let g:plug_threads = 4
call plug#begin(stdpath('data') . '/plugged')
"Plug 'neovim/nvim-lspconfig'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'lambdalisue/suda.vim'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'cdelledonne/vim-cmake'
Plug 'sbdchd/neoformat'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
Plug 'tomasr/molokai'
Plug 'lilydjwg/fcitx.vim', {'branch': 'fcitx5'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'lervag/vimtex'
call plug#end()

au FileType c,cpp setlocal comments-=:// comments+=f://

let g:molokai_original = 1
colorscheme molokai

syntax on
filetype plugin indent on 

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
set updatetime=300
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1
set encoding=UTF-8
set cursorline
set buftype=
set backspace=indent,eol,start
set formatoptions=tcrqn
set hidden
set termguicolors
set background=dark
set autoread
set clipboard=unnamed
set nobackup
set confirm
set autoindent
set cindent cino=j1,(0,ws,Ws
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set number
set history=1000
set noswapfile
set hlsearch
set incsearch
set gdefault
set laststatus=2
set cmdheight=1
set viminfo+=!
set linespace=0
set wildmenu
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set showmatch
set matchtime=1
set scrolloff=3
set smartindent
set previewheight=2
set completeopt=menu
set listchars=tab:\▏\ 
set list

"airline
let g:airline_exclude_filename = []
let g:airline_theme='molokai'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'

"NERDTree
let g:NERDTreeWinSize=30
let g:NERDTreeChDirMode=2
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"vimtex
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
			\ 'build_dir' : '',
			\ 'callback' : 1,
			\ 'continuous' : 1,
			\ 'executable' : 'latexmk',
			\ 'hooks' : [],
			\ 'options' : [
			\	'-shell-escape',
			\	'-verbose',
			\	'-file-line-error',
			\	'-synctex=1',
			\	'-8bit',
			\	'-interaction=nonstopmode'
			\ ],
			\}

"Neoformat
let g:neoformat_c_clangformat = {
			\ 'exe': 'clang-format',
			\ 'args': ['-style="{UseTab: ForIndentation, TabWidth: 4, IndentWidth: 4, ColumnLimit: 120, AllowShortFunctionsOnASingleLine: All}"'],
			\ }
let g:neoformat_glsl_clangformat = {
			\ 'exe': 'clang-format',
			\ 'args': ['-style="{AlignEscapedNewlines: DontAlign, UseTab: ForIndentation, ColumnLimit: 120, TabWidth: 4, IndentWidth: 4, BinPackParameters: false}"'],
			\ }
let g:neoformat_cpp_clangformat = {
			\ 'exe': 'clang-format',
			\ 'args': ['-style="{AccessModifierOffset: -4, AlignEscapedNewlines: DontAlign, UseTab: ForIndentation, TabWidth: 4, IndentWidth: 4, ColumnLimit: 120, AllowShortFunctionsOnASingleLine: All}"'],
			\ }

" COC
" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

inoremap <silent><expr> <M-;> coc#refresh()
nmap <silent> <M-g> <Plug>(coc-definition)
nmap <F2> <Plug>(coc-rename)
nmap <silent> <M-r> <Plug>(coc-references)

" Vim-CMake
let g:cmake_generate_options = ['-DCMAKE_EXPORT_COMPILE_COMMANDS=1', '-GNinja']
let g:cmake_default_config = 'Release'
let g:cmake_console_size = 8
nmap <M-o> <Plug>(CMakeOpen)

nnoremap <silent> <M-x> :bdelete<CR>
nnoremap <silent> <M-q> :Bclose<CR>
nnoremap <silent> <M-b> :Buffers<CR>
nnoremap <silent> <M-f> :Files<CR>
nnoremap <silent> <M-t> :BTags<CR>
nnoremap <silent> <M-d> :CocFzfList diagnostics<CR>
nnoremap <silent> <M-e> :NERDTree<CR>
nnoremap <silent> <M-m> :Neoformat<CR>
nnoremap <silent> <M-h> :bp<CR>
nnoremap <silent> <M-l> :bn<CR>
command W w

" Delete buffer while keeping window layout (don't close buffer's windows).
" Version 2008-11-18 from http://vim.wikia.com/wiki/VimTip165
if v:version < 700 || exists('loaded_bclose') || &cp
	finish
endif
let loaded_bclose = 1
if !exists('bclose_multiple')
	let bclose_multiple = 1
endif

" Display an error message.
function! s:Warn(msg)
	echohl ErrorMsg
	echomsg a:msg
	echohl NONE
endfunction

" Command ':Bclose' executes ':bd' to delete buffer in current window.
" The window will show the alternate buffer (Ctrl-^) if it exists,
" or the previous buffer (:bp), or a blank buffer if no previous.
" Command ':Bclose!' is the same, but executes ':bd!' (discard changes).
" An optional argument can specify which buffer to close (name or number).
function! s:Bclose(bang, buffer)
	if empty(a:buffer)
		let btarget = bufnr('%')
	elseif a:buffer =~ '^\d\+$'
		let btarget = bufnr(str2nr(a:buffer))
	else
		let btarget = bufnr(a:buffer)
	endif
	if btarget < 0
		call s:Warn('No matching buffer for '.a:buffer)
		return
	endif
	if empty(a:bang) && getbufvar(btarget, '&modified')
		call s:Warn('No write since last change for buffer '.btarget.' (use :Bclose!)')
		return
	endif
	" Numbers of windows that view target buffer which we will delete.
	let wnums = filter(range(1, winnr('$')), 'winbufnr(v:val) == btarget')
	if !g:bclose_multiple && len(wnums) > 1
		call s:Warn('Buffer is in multiple windows (use ":let bclose_multiple=1")')
		return
	endif
	let wcurrent = winnr()
	for w in wnums
		execute w.'wincmd w'
		let prevbuf = bufnr('#')
		if prevbuf > 0 && buflisted(prevbuf) && prevbuf != btarget
			buffer #
		else
			bprevious
		endif
		if btarget == bufnr('%')
			" Numbers of listed buffers which are not the target to be deleted.
			let blisted = filter(range(1, bufnr('$')), 'buflisted(v:val) && v:val != btarget')
			" Listed, not target, and not displayed.
			let bhidden = filter(copy(blisted), 'bufwinnr(v:val) < 0')
			" Take the first buffer, if any (could be more intelligent).
			let bjump = (bhidden + blisted + [-1])[0]
			if bjump > 0
				execute 'buffer '.bjump
			else
				execute 'enew'.a:bang
			endif
		endif
	endfor
	execute 'bdelete'.a:bang.' '.btarget
	execute wcurrent.'wincmd w'
endfunction
command! -bang -complete=buffer -nargs=? Bclose call <SID>Bclose(<q-bang>, <q-args>)
