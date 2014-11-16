set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s,[,],<,>,~
set mouse=
set fileencodings=utf-8,iso-2022jp,sjis,default
syntax on
set nohlsearch
highlight StatusLine ctermfg=black ctermbg=grey
highlight CursorLine ctermfg=none ctermbg=darkgray cterm=none
highlight MatchParen ctermfg=none ctermbg=darkgray
highlight Comment ctermfg=DarkGreen ctermbg=NONE
highlight Directory ctermfg=DarkGreen ctermbg=NONE
set laststatus=2
set statusline=%F%r%h%=
set number
set incsearch
set ignorecase
set wildmenu wildmode=list:full
nmap <silent> <Tab> 15<Right>
vmap <silent> <Tab> <C-o>15<Right>
nmap <silent> <S-Tab> 15<Left>
vmap <silent> <S-Tab> <C-o>15<Left>
nmap <silent> <C-n> :update<CR>:bn<CR>
imap <silent> <C-n> <ESC> :update<CR>:bn<CR>
vmap <silent> <C-n> <ESC> :update<CR>:bn<CR>
cmap <silent> <C-n> <ESC> :update<CR>:bn<CR>
imap <C-b> <ESC>:read ‾/.vim/bf<CR>
nmap <C-b> :read ‾/.vim/bf<CR>
vmap <C-b> :w! ‾/.vim/bf<CR>

nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)
nmap <Space>j <Plug>(quickhl-cword-toggle)
nmap <Space>J <Plug>(quickhl-tag-toggle)
map H <Plug>(operator-quickhl-manual-this-motion)

" <C-k> で snippet の展開"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)


set tabstop=2
set shiftwidth=2

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'tpope/vim-fugitive'
filetype plugin indent on

Bundle 'h1mesuke/unite-outline'
Bundle 'Shougo/unite.vim'
Bundle 't9md/vim-quickhl'
Bundle 'itchyny/lightline.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

Bundle 'thinca/vim-quickrun'
let g:quickrun_config={'*': {'split': ''}}
set splitbelow
let g:quickrun_config={'*': {'hook/time/enable': '1'},}

"Markdownプレビュー
":PrevimOpen
Bundle 'tyru/open-browser.vim'
Bundle 'kannokanno/previm'
let g:previm_open_cmd = ' '
augroup PrevimSettings
	autocmd!
	autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

"Auto save
Bundle 'vim-scripts/vim-auto-save'
let g:auto_save = 1

"バイナリ編集モード
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre *.bin let &binary =1
	autocmd BufReadPost * if &binary | silent %!xxd -g 1
	autocmd BufReadPost * set ft=xxd | endif
	autocmd BufWritePre * if &binary | execute "%!xxd -r" | endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod | endif
augroup END

