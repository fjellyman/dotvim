" - - - - - vundle setup - - - - -

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" - - - - - plugins - - - - - 
Plugin 'gmarik/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'botandrose/vim-testkey'
Plugin 'vim-javascript'

" now add everything after the vundle calls
call vundle#end()
filetype plugin indent on

" - - - - - checking os - - - - -

if has('win32') || has('win64')
	set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

	" ----- default vimrc lines start here -----
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
	
	set diffexpr=MyDiff()
	function MyDiff()
		let opt = '-a --binary '
		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
		let arg1 = v:fname_in
		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
		let arg2 = v:fname_new
		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
		let arg3 = v:fname_out
		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
		let eq = ''
		if $VIMRUNTIME =~ ' '
			if &sh =~ '\<cmd'
				let cmd = '""' . $VIMRUNTIME . '\diff"'
				let eq = '"'
			else
				let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
			endif
		else
			let cmd = $VIMRUNTIME . '\diff'
		endif
		silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
	endfunction
	" ----- default vimrc lines end -----
endif 

" - - - - - set vim standards - - - - -

set autoindent
set hidden
set history=500
set noexpandtab
set number
set modifiable
set pastetoggle=<F2>
set ruler
set shiftwidth=4
set showmatch
set showmode
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set wmh=0
set wrap
syntax on

" - - - - - mappings - - - - - 

" leader key
let mapleader = "\<space>"

" quickly exit insert mode
inoremap jk <esc>

" view/edit vimrc quickly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eh :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" buffers
nnoremap <leader>h  :bn<cr>
nnoremap <leader>l  :bp<cr>
nnoremap <leader>ff :NERDTreeToggle<cr>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" navigate splits
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" resize splits
"nnoremap <c-[> :resize -5<cr>
"nnoremap <c-]> :resize +5<cr>
"nnoremap <leader>] :vertical resize -5<cr>
"nnoremap <leader>[ :vertical resize +5<cr>

" copy/paste
nnoremap <f2> :set invpaste paste?<cr>

" habbit breaking
nnoremap <up> <nop>
nnoremap <down> <nop> 
nnoremap <left> <nop> 
nnoremap <right> <nop>
inoremap <esc> <nop>

" folds
nnoremap <silent> <tab> @=(foldlevel('.')?'za':"\<space>")<cr>
vnoremap <tab> zf 

" - - - - - filetype changes - - - - - 

" markdown
augroup filetype_md
	autocmd FileType markdown	set spell spelllang=en_us
augroup END

" golang
augroup filetype_go
	autocmd FileType go nmap <leader>r <plug>(go-run)
	autocmd FileType go nmap <leader>b <plug>(go-build)
	autocmd FileType go nmap <leader>t <plug>(go-test)
	autocmd FileType go nmap <leader>i <plug>(go-info) 
	autocmd FileType go nmap <leader>e <plug>(go-rename) 
	autocmd FileType go nmap <leader>s <plug>(go-implements) 
	autocmd FileType go nmap <leader>ds <plug>(go-def-split)
	autocmd FileType go nmap <leader>dv <plug>(go-def-vertical)
	autocmd FileType go nmap <leader>dt <plug>(go-def-tab)
	autocmd FileType go nmap <leader>gd <plug>(go-doc)
	autocmd FileType go nmap <leader>gv <plug>(go-doc-vertical)
	autocmd FileType go nmap <leader>gb <plug>(go-doc-browser)
augroup END 

" - - - - - vim-go - - - - -

let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" - - - - - vim-testkey - - - - -

let g:TestKey = { 'testkey': '<leader>m'} 
