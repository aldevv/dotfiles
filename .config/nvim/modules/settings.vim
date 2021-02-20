syntax enable
" disable compatibility to vi, to activate vim improvements
set nocompatible
set shell=/bin/zsh
let mapleader = " "
" let maplocalleader=','
"======================
set updatetime=1500 " this is for autosave in tex files(every cursorhold event)
set encoding=utf-8
scriptencoding utf-8
set splitright
set splitbelow

"fix for yankring and neovim
let g:yankring_clipboard_monitor=0

"setlocal spell
" set spelllang=es
set spelllang=en_us,es
"set spelllang=en_us

" whichkey
" set timeoutlen=1500
set timeoutlen=700
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <leader><space>   :<c-u>WhichKey '<leader><leader>'<CR>
filetype plugin indent on
" set signcolumn=yes
" set foldmethod=indent

let &t_8f = '\<esc>[38;2;%lu;%lu;%lum'
let &t_8b = '\<esc>[48;2;%lu;%lu;%lum'
set textwidth=95
" set nofoldenable
" set foldmethod=indent
set viewoptions=folds,cursor
set sessionoptions=folds
let g:extension = expand('%:e')
" set foldmethod=manual
" autocmd FileType * set foldmethod=syntax
" autocmd FileType python set foldmethod=indent

function! FoldForJava()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^\s+(private|public|protected)?\s+\S+\s+\S+\s+\S+\s*\(.*\)\s*\{$') > -1
        return ">1"
    elseif match(line, '\v^\s*(for|while)\s*\(.+\)\s*?\{') > -1
        return ">2"
    elseif match(line, '\v^\s*if\s*\(.+\)') > -1
        return ">3"
    else
        return "="
    endif
endfunction

function! FoldForPython()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^class\s+\S+\s?:') > -1
        return ">3"
    elseif match(line, '\v^\s*def\s\S+\(.*\)\s?:') > -1
        return ">4"
    elseif match(line, '\v^\s+(if|for|while).+\(.+\)\s?:$') > -1
        return ">5"
    elseif match(line, '\v^(if|for|while).+\(.+\)\s?:$') > -1
        return ">2"
    elseif match(line, '\v^\S+\s?\=\s?.+$') > -1
        return ">0"
    else
        return "="
    endif
endfunction

function! FoldForJavascript()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^class\s.+\{$') > -1
        return ">1"
    elseif match(line,'\v^\s*function\s+\S+\(.*\)\s*\{$') > -1
        return ">2"
    elseif  match(line,'\v^\s*(if)@!(while)@!(for)@!.*\(.*\)\s*\{$') > -1
        return ">2"
    elseif  match(line,'\v^\s*\S+\s?\=\s?\(.*\)\s?\=\>.+\{$') > -1
        return ">2"
    elseif match(line, '\v^\s*(for|while)\s*\(.+\)\s*\{?$') > -1
        return ">3"
    elseif match(line, '\v^\s*if\s*\(.+\)\s*\{?$') > -1
        return ">4"
    else
        return "="
    endif
endfunction

function! FoldForVim()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^function!?\s.+$') > -1
        return ">2"
    elseif match(line, '\v^\s*(augroup|aug)\s(END)@!.+$') > -1
        return ">2"
    elseif match(line, '\v^\s*(if|for|while).+\(.+\)\s?$') > -1
        return ">1"
    elseif match(line, '\v^(endfunction|endif|augroup END)@!\S*$') > -1
        return ">0"
    else
        return "="
    endif
endfunction

if has('folding')
  " set nofoldenable
  set foldenable
  " set foldmethod=indent               " not as cool as syntax, but faster
  set foldlevelstart=99               " start unfolded
  set foldnestmax=5
endif

autocmd FileType java setlocal foldmethod=expr foldexpr=FoldForJava()
autocmd FileType python setlocal foldmethod=expr foldexpr=FoldForPython()
autocmd FileType javascript setlocal foldmethod=expr foldexpr=FoldForJavascript()
autocmd FileType vim setlocal foldmethod=expr foldexpr=FoldForVim()
" these work
autocmd FileType c,cpp setlocal foldmethod=syntax
set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•


" autocmd FileType vim set foldmethod=marker
" set foldlevel=4
" set foldlevelstart=2
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup END

" better folding style
let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'
function! MyFoldText() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let line = getline(v:foldstart)
  let l:first=substitute(line, '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  let nucolwidth = max([strlen(line('$')), &numberwidth-1])
  let l:padding = wincol()-virtcol('.')
  let l:padding += nucolwidth
  " let nucolwidth = &fdc + &relativenumber * &numberwidth
  let windowwidth = winwidth(0) - l:padding
  let foldedlinecount = v:foldend - v:foldstart + 3 " because of [ℓ]"
  let fillcharcount = windowwidth - len(l:first) - len(foldedlinecount)
  let concatspaces = repeat('·',fillcharcount)
  return l:first . concatspaces . l:lines
  " return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

set inccommand=split
set foldtext=MyFoldText()
" set wrap
set formatoptions=qrn1

" set foldcolumn=1
set wildmode=longest,list,full
set expandtab "always use spaces and not tabs
set noerrorbells
set ignorecase
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4

set smartindent
set nowrap
set noswapfile
set backup
set backupdir=~/.config/nvim/backups
set undodir=~/.config/nvim/undodir
set autoindent
"persistent undo
set undofile
set incsearch
set relativenumber
set laststatus=0
set cmdheight=1
" to  select and move cursor
set mouse=a
" to show stuff under the modeline
set noshowmode
set autochdir
" change buffers without saving
set hidden
" ask to save when not saved
set confirm

"detect root in git repo
if executable('rg')
  let g:rg_derive_root='true'
endif

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python_highlight_all = 1
" if exists("python_highlight_all")
"   let python_space_error_highlight = 1
"  endif
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" share registers between vim instances
augroup SHADA
  autocmd!
  autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
        \ if exists(':rshada') | rshada | wshada | endif
augroup END

" if quickfix or terminal window is the last window, then close vim
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
  au WinEnter * if winnr('$') == 1 && &buftype == "terminal"|q|endif
aug END
