if empty(getenv('NOCOC'))
  " TODO treesitter has an option to enable this, remove it once the migration is done
  syntax enable
endif
set nocompatible " disable compatibility to vi, to activate vim improvements
if executable('zsh')
  set shell=/bin/zsh
endif
" set timeoutlen=700
" let mapleader = "\<Space>"
" let maplocalleader="\<BS>"
" use ñ for text obj?

"===================
" WHICHKEY
"===================
" nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
" vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <silent><localleader> :<c-u>WhichKey "\<BS\>" <CR>
" nnoremap <silent> <leader><space>   :<c-u>WhichKey '<leader><leader>'<CR>

"======================

set updatetime=1500 " this is for autosave in tex files(every cursorhold event)
set encoding=utf-8
scriptencoding utf-8
set splitright
set splitbelow
set title
" set titlestring=:\ %-25.55F\ %a%r%m titlelen=70
" set title titlestring=%{expand(\"%:p\")}\ %a%r%m
" set title titlestring=%{expand('%:p:h:t')}/%t

" set title titlestring=...%{strpart(expand(\"%:p:h\"),stridx(expand(\"%:p:h\"),\"/\",strlen(expand(\"%:p:h\"))-12))}/%{expand(\"%:t:r\")}\ %m\ %Y\ %l\ of\ %L
" set titlestring=%{expand(\"%:p:~\")}\ %a%r%m
" let &titlestring = '%t%( %m%r%)%( <%{get(g:, "cur_project", "")}>%)' .
"             \ '%( (%{expand("%:~:.:h")})%)' .
            " \ '%( (%{getcwd()})%)%( %a%) - %(%{v:servername}%)'
  set titlestring=\ %{expand(\"%:p:~\")}%a%r%m
" set titlestring=%t
" set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
" set title titlestring=%<%F%=%l/%L-%P titlelen=70
"fix for yankring and neovim
let g:yankring_clipboard_monitor=0

"setlocal spell
" set spelllang=es
set spelllang=en_us,es
"set spelllang=en_us

filetype plugin indent on
filetype plugin on
" set lazyredraw
" set signcolumn=yes

let &t_8f = '\<esc>[38;2;%lu;%lu;%lum'
let &t_8b = '\<esc>[48;2;%lu;%lu;%lum'
set textwidth=95
set viewoptions=folds,cursor
set sessionoptions=folds
let g:extension = expand('%:e')

set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•
set listchars+=eol:↲

if has('folding')
  set foldenable
  set foldlevelstart=99               " start unfolded
  set foldnestmax=5
endif

augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
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
set foldtext=MyFoldText()

set formatoptions=qrn1
set inccommand=split
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
