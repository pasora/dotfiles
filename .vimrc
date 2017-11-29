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
set t_Co=256
set tabstop=2
set expandtab
set laststatus=2
set shiftwidth=2
set statusline=%F%r%h%=
set number
set incsearch
set ignorecase
set smartindent
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
let g:auto_save_in_insert_mode = 0

let g:gitgutter_sign_removed_first_line = '_^'

let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'right': [ [ 'syntastic', 'lineinfo' ],
        \              [ 'percent' ], [ 'winform' ],
        \              [ 'fileformat', 'fileencoding', 'filetype' ] ],
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'branch', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'linetotal': 'LightLineTotal',
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'filepath': 'LightLineFilepath',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode',
        \   'winform': 'LightLineWinform'
        \ },
        \ 'separator': { 'left': ">", 'right': "<" },
        \ 'subseparator': { 'left': ">", 'right': "<" },
        \ 'component_expand': {
        \   'syntastic': 'SyntasticStatuslineFlag',
        \ },
        \ 'component_type': {
        \   'syntastic': 'error',
        \ }
        \ }

let g:lightline.component = {
    \ 'lineinfo': '%3l[%L]:%-2v'}

function! LightLineWinform()
  return winwidth(0) > 50 ? 'w' . winwidth(0) . ':' . 'h' . winheight(0) : ''
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? "RO" : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%') && winwidth(0) <=120 ? expand('%:t') : winwidth(0) >120 ? expand('%:p') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFilepath()
  return winwidth(0) <=120 ? expand('%:h') : ''
endfunction

function! LightLineFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && winwidth(0) > 55
      let _ = fugitive#head()
      return strlen(_) ? 'RO '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightLineFileformat()
  return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 60 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 30 ? lightline#mode() : ''
endfunction

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

