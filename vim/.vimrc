call pathogen#infect()

echom "Hello again! >^.^<"

set number
set numberwidth=1
set nu rnu
set encoding=utf-8
set nopaste
set autoindent
syntax enable
set nocompatible
set tabstop=2 shiftwidth=2 expandtab
filetype plugin indent on
filetype indent on

set guifont=3270\ Narrow\ Nerd\ Font\ Complete\ 8

"set the keys for tab switching 
nnoremap <C-h> gT
nnoremap <C-l> gt

"set the default viewer for vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtext_compiler_latexmk_engines = "xelatex"
let g:Tex_MultipleCompileFormats='pdf,bib,pdf'

"set config file for ycm
let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py'

"html autocompleteing for html, js and jsx files
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType js set omnifunc=htmlcomplete#CompleteTags
autocmd FileType jsx set omnifunc=htmlcomplete#CompleteTags


"Function moves lines up without accidentally deleting them
function! MoveLineUp()
	if line(".") == 1
		echom "Top of File!"
	else 
		:move -2
	endif
endfunction

"Function moves lines down without accidentally deleting them
function! MoveLineDown()
	if line(".") == line("$")
		echom "Bottom of File!"
	else
		:move +1
	endif
endfunction

map + :call MoveLineUp()<CR>
map - :call MoveLineDown()<CR>


"Undo and redo
map <c-z> undo

if has('syntax')
	syntax enable
	silent! colorscheme eldar
endif

"enables zoom in and zoom out
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

"nerdtree hotkeys
nmap <F10> :NERDTreeToggle<CR>

"Some helpful abbriviations
iabbrev ssig -- <CR>David H Smith IV<CR>smithd77@wwu.edu<CR>

"auto reindent
map <F7> mzgg=G'z

"allows for running python in vim 
imap <F9> <Esc>:w<CR>:!clear;python3 %<CR>

"c comment hotkey
vnoremap <silent> # :s/^/c/<cr>:noh<cr>
vnoremap <silent> -# :s/^c//<cr>:noh<cr>

"python comment hotkey
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

"set up some autocomplete
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>

"gimme a word count
function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d [:space:]"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()
