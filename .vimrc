" you have to place ~/.vim/rc/dein.toml and ~/.vim/rc/dein_lazy.toml

set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set fileencodings=utf-8,iso-2022jp,sjis,default
set nohlsearch
highlight StatusLine ctermfg=black ctermbg=gray
highlight CursorLine ctermfg=none ctermbg=darkgray cterm=none
highlight MachParen ctermfg=none ctermbg=darkgray
highlight Comment ctermfg=DarkGreen ctermbg=none
highlight Directory ctermfg=DarkGreen ctermbg=none
set tabstop=2
set expandtab
set laststatus=2
set shiftwidth=2
set statusline=%F%r%h%=
set number
set incsearch
set ignorecase
set autoindent
set wildmenu wildmode=list:full
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Right>
vmap <silent> <S-Tab> <C-o>15<Right>
nmap <silent> <C-n> :update<CR>:bn<CR>
imap <silent> <C-n> <ESC> :update<CR>:bn<CR>
vmap <silent> <C-n> <ESC> :update<CR>:bn<CR>
cmap <silent> <C-n> <ESC> :update<CR>:bn<CR>
imap <C-b> <ESC>:read ‾/.vim/bf<CR>
nmap <C-b> :read ‾/.vim/bf<CR>
vmap <C-b> :w! ‾/.vim/bf<CR>


" dein settings
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
	if !isdirectory(s:dein_repo_dir)
		execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	let g:rc_dir = expand('~/.vim/rc')
	let s:toml = g:rc_dir . '/dein.toml'
	let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})

	call dein#end()
	call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

syntax on

augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:auto_save = 1

let g:vimtex_fold_envs = 0
let g:vimtex_view_general_viewer = 'mupdf'

augroup filetype
  autocmd!
  autocmd BufRead,BufNewFile *.tex set filetype=tex
augroup END

let g:tex_conceal=''
