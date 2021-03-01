" testing inclusiveness (these work)
" nnoremap db dvb
" nnoremap dB dvB
" colemak movement
noremap n j
noremap e k
noremap j e
noremap gj ge
noremap gJ gE
nnoremap l i
nnoremap i l
" vnoremap l i
vnoremap i l
noremap k nzzzv
noremap K Nzzzv
" put last searched items into QuickFix window
nnoremap <leader>- :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

nnoremap º <c-^>
nnoremap ^ <c-^>

" move lines without clipboard
nnoremap E :m .-2<cr>==
nnoremap N :m .+1<cr>==
vnoremap E :m '<-2<cr>gv=gv
vnoremap N :m '>+1<cr>gv=gv

" vnoremap E :m '<-2<cr>gv=gv
" vnoremap N :m '>+1<cr>gv=gv
"
noremap J E
vnoremap L I
noremap ge J
noremap gE a<cr><esc>k$
noremap ' `
" testing
noremap I L
nnoremap L I

noremap <c-w>N <c-w>J
noremap <c-w>E <c-w>K
noremap <c-w>I <c-w>L

noremap <c-w>n <c-w>j
noremap <c-w>e <c-w>k
noremap <c-w>i <c-w>l

noremap <c-w>k <c-w>n

" vertical version of <c-w>^
noremap <silent><c-w>~ :vsp #<cr>
" noremap <a-n> <c-n>
" noremap <a-e> <c-p>
" nnoremap <CR> o<Esc>
" nnoremap <S-CR> O<Esc>
" nnoremap [13;2u o
"
noremap - /\v
vnoremap - /\v
noremap / -
noremap <silent><leader>o :call ToggleQuickFix()<cr>
noremap <silent><leader>O :call ToggleLocation()<cr>
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
    execute "normal! \<c-w>k"
  else
    cclose
  endif
endfunction
function! ToggleLocation()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    lopen
    execute "normal! \<c-w>k"
  else
    lclose
  endif
endfunction

" for folds
nnoremap <leader>Z zMzvzz

nnoremap <silent><leader>,n  :w !npm start 2>/dev/null<cr>
nnoremap <silent><leader>,ri  :w ! [ ! -e '.env' ] && python3 -m venv .env 2>/dev/null; pip3 install -r requirements.txt 2>/dev/null<cr>



let g:extension = expand('%:e')
" nnoremap <silent> <leader>z :call ToggleFMethod()<cr>
" function ToggleFMethod()
"   let method=&foldmethod
"   if method == "expr"
"     set foldmethod=manual
"   else
"     set foldmethod=expr
"   endif
" endfunction

" this didnt work because it needs to be put down lower, but is a good example
" of how to obtain input for a command
"
function! GetName(detail)
    call inputsave()
    let l:filename = input(a:detail)
    call inputrestore()
    return l:filename
endfunction

" function! GetNameDmenu(detail)
"   " call inputsave()
"   let l:filename = system('dmenu -p ' . shellescape(a:detail))
"   echo l:filename
"     " call inputrestore()
"     " return l:filename
" endfunction

" nnoremap <leader>Sd  :call GetNameDmenu("something")<cr>
function! CreateFileTouch()
  let l:filename = GetName("Enter File Name: ")
  if len(l:filename) == 0
      return
  endif

  if l:filename =~ '\v.*/.+'
    exec system('filename=' . l:filename . '; mkdir -p ${filename%\/*}/')
  endif

  exe ":!touch " . l:filename
  if !SpecialWindow()
    w
  endif
  " this condition works when nerdtree is open or closed
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

function! CreateFileEnter()
  let l:filename = GetName("Enter File Name: ")
  if len(l:filename) == 0
      return
  endif
  
  if l:filename =~ '\v.*/.+'
    exec system('filename=' . l:filename . '; mkdir -p ${filename%\/*}/')
  endif

  exe ":e " . l:filename
  " this condition works when nerdtree is open or closed
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

function! CreateDir()
  let l:dir_name = GetName("Enter Dir Name: ")
  if len(l:dir_name) == 0
      return
  endif
  exe ":!mkdir -p " . l:dir_name

  if !SpecialWindow() 
    w
  endif

  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction

nnoremap <silent><leader>sn  :silent call CreateFileEnter()<cr>
nnoremap <silent><leader>st  :silent call CreateFileTouch()<cr>
nnoremap <silent><leader>sf  :silent call CreateDir()<cr>
" nnoremap <leader>sF  :call RemoveDir()<cr>
" nnoremap <leader>sN  :call RemoveFile()<cr>

" 'cd' towards the directory in which the current file is edited
" but only change the path for the current window
nnoremap <leader>sc :lcd %:h<CR>

" close buffers
noremap <leader>sd :bd<cr>

" change buffers like vscode
" noremap <silent>E :bprevious<cr>
" noremap <silent>N :bnext<cr>

" clipboard
" "*p pastes what is highlighted by the mouse
" ""p and "0p are the default registers
"
"diffput
vnoremap <leader>,p "_dP
" set clipboard=unnamedplus
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+y$
nnoremap  <leader>y  "+y

vnoremap  <leader>d  "+d
nnoremap  <leader>D  "+d$
nnoremap  <leader>d  "+d

nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nmap <leader>gp "+gp
" copy default register into the main clipboard
" nnoremap <silent> <leader>. :let @+ = @"<cr>

"fold
noremap ze zk
noremap zn zj
noremap zD zE
noremap z[ [z
noremap z] ]z

"useful
nnoremap Y y$
nnoremap V v$
nnoremap gl gi
nnoremap , ;
nnoremap ; ,
nnoremap <leader>cct :!ctags -R<cr>



" noremap gss !python2 -c "import sys; print(sys.stdin.read())"<cr>
"https://stackoverflow.com/questions/40072761/vim-send-visual-block-to-external-command
"added B and S (vis plugin)
"B for applying commands to the visually selected area and only to that visual area
"S is for searching stuff ONLY in the visually selected area
vnoremap <silent><leader>lgs :B !sortList.py <cr>t]xT[
vnoremap <silent><leader>lgr :B !sortListR.py <cr>t]xT[


nnoremap gñ :SyntaxQuery<CR>
nnoremap <silent><leader>,t :silent call Toggle_transparent()<CR>
function Toggle_transparent()
  exec ":!toggleTrans"
endfunction

" general insert commands
inoremap <a-m> <++>
"" Guide navigation
noremap <a-k> <Esc>/<++><Enter>"_c4l
inoremap <a-k> <Esc>/<++><Enter>"_c4l
vnoremap <a-k> <Esc>/<++><Enter>"_c4l


" shell
noremap <leader>rb i#!/bin/sh<CR><CR>

"global do
nnoremap <A-R> :%g/\v/norm!<Left><Left><Left><Left><Left><Left>
nnoremap <A-r> :%norm!<space>
vnoremap <A-R> :g/\v/norm!<Left><Left><Left><Left><Left><Left>
vnoremap <A-r> :norm!<space>

" Alias replace all to
nnoremap <A-s> :%s/\v//gI<Left><Left><Left><Left>
vnoremap <A-s> :s/\v//gI<Left><Left><Left><Left>
vnoremap <A-S> :s/\v//gI<Left><Left><Left><Left>
" save with no permission using w!!, could be cnoremap
"
cnoreabbrev w!! w !sudo tee > /dev/null %

map <leader>rs :!./%<cr>
nnoremap <silent><leader>rc  :w !sudo chmod +x %<cr>
map <silent> <F11> /\A\zs\a<cr>
" ctrl alt

noremap  <Down> 5<c-w>-
noremap  <Up> 5<c-w>+
noremap  <Right> 5<c-w>>
noremap  <Left> 5<c-w><
" noremap  N 5<c-w>-
" noremap  E 5<c-w>+
" noremap  + 5<c-w>>
" noremap  - 5<c-w><

" split movement , cant be <c-i> because that is mapped to be the opposite of <c-o>
nnoremap <leader>h <c-w>h
nnoremap <leader>n <c-w>j
nnoremap <leader>e <c-w>k
nnoremap <leader>i <c-w>l
noremap <tab> %
vnoremap <tab> %
nnoremap <M-i> <c-i>
nnoremap <M-o> <c-o>


" noremap <c-i> <c-i>
" set <tab>=^[
" noremap <TAB> <tab>


" nnoremap <leader>ss <c-w>s
" nnoremap <leader>sv <c-w>v

" map <leader>i :setlocal autoindent<cr>
" map <leader>I :setlocal noautoindent<cr>
map  <silent><leader>Q :silent w !sudo tee %<CR>
" save without autocmd (no formatting) 
function SaveNoFormat() abort
  :noautocmd w
  if expand('%') == 'keymap.c'
    " exec ':!$PROJECTS/Micro/Lily58/qmk_firmware/bin/qmk flash -kb lily58 -km mine-def'
    exec ':!qmk flash'
  endif
endfunction
map  <silent><leader>q :call SaveNoFormat()<CR>
map  <leader>t :w<CR>
map  <leader>ss :wq<CR>
" map <leader><F1> :e ~/.config/nvim/init.vim<cr>
nnoremap <F6> :e $HOME/.config/nvim/init.vim<cr>
map <leader><F2> :e ~/.zshrc<cr>
map <C-&> <C-^>
" noremap  <leader>ww :w<CR>
noremap  ! :!
noremap  <F7> :set spell! \| set wrap<CR>

map ñ :

" Ctrl-O lets you do just one command in insert mode

inoremap <a-h> <Left>
" inoremap <C-n> <Down>
" inoremap <C-e> <Up>
inoremap <a-i> <Right>

cnoremap <a-h> <Left>
cnoremap <a-e> <Up>
cnoremap <a-n> <Down>
cnoremap <a-i> <Right>

" map <silent> <leader>RR :call Runner()<cr>
" autocmd FileType python map <silent> <cr> :call Runner()<cr>
" autocmd FileType python nnoremap <buffer> <s-cr> :silent w<bar>only<bar>vsp<bar>term ipython3 -i %<cr>
autocmd FileType python nnoremap <buffer> <s-cr> :silent w<bar>only<bar>vsp<bar>term jupyter console<cr> <c-w>l :JupyterConnect<cr><cr> :JupyterRunFile<cr>
autocmd FileType java nnoremap <silent><buffer> <s-cr> :silent w<bar>execute "!java ".expand('%:t:r')<cr>
noremap <silent><leader><cr> :silent call RunnerTerminal()<cr>
nnoremap <silent><cr> :silent call RunnerEnter()<cr>

function! SpecialWindow()
  return &buftype == 'quickfix' || &buftype == 'nofile'
endfunction

function! RunnerEnter()
  " if bufname('%') == '' || &buftype == 'quickfix' || &buftype == 'nofile'
  if SpecialWindow() || bufname('%') == ''
    silent execute "normal! \<CR>"
  else
    silent call Runner()
  endif
endfunction


function! Runner()
  exec 'silent w'
  let l:runner = 'Dispatch! '
  let l:special_cases = ['java', 'rs', 'go']
  if index(l:special_cases, g:extension) >= 0 " si esta en el arreglo
    let l:runner = 'Dispatch! '
  else 
    let l:runner = 'Dispatch '
  endif
  silent execute l:runner
  execute 'Copen'
  execute "normal! \<c-w>k"
endfunction


" function! Runner()
"   exec 'silent w'
"   let l:runner = 'Dispatch '
"   if g:extension != 'java'
"     execute l:runner
"   else
"     let l:runner = 'Dispatch! '
"     echo "entre"
"     execute l:runner
"     execute 'Copen'
"     execute "normal! \<c-w>k"
"   endif
" endfunction

function! RunnerTerminal()
  exec 'silent w'
  let l:runnerCommand = projectionist#query('dispatch')[0][1]
  let l:runner = 'T '
  execute l:runner . l:runnerCommand
  " execute "normal! \<c-w>k"
endfunction

" open browser in current file folder
map <silent> <leader>ra :silent call jobstart('setsid st -e ranger $(dirname %) 2>&1')<cr>
"old
" map <leader>ra :silent !setsid st -e ranger $(dirname %) 2>&1 &<cr>


"debugging python, needs pip install ipdb
func! s:SetBreakpoint()
  cal append('.', repeat(' ', strlen(matchstr(getline('.'), '^\s*'))) . 'import ipdb; ipdb.set_trace()')
endf

func! s:RemoveBreakpoint()
  exe 'silent! g/^\s*import\sipdb\;\?\n*\s*ipdb.set_trace()/d'
endf

func! s:ToggleBreakpoint()
  if getline('.')=~#'^\s*import\sipdb' | cal s:RemoveBreakpoint() | el | cal s:SetBreakpoint() | en
endf
" nnoremap <F6> :call <SID>ToggleBreakpoint()<CR>

"====================
" ABBREVIATIONS
"====================
autocmd FileType python,java,js,jsx,ts iabbrev <buffer> im import
" autocmd FileType python,java,js,jsx,ts iabbrev <buffer> rt return
" autocmd FileType python,java,js,jsx,ts iabbrev <buffer> fa False
" autocmd FileType python,java,js,jsx,ts iabbrev <buffer> tr True
" autocmd FileType python,java,js,jsx,ts iabbrev <buffer> br Break
" autocmd FileTYpe c,cpp,java imap < <><esc>ha

" use * in visual mode
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
" map <silent><leader>,f :silent execute '!formatCode' shellescape(&ft)<cr>
nnoremap <leader>V V`]

command! -bang -nargs=? -complete=dir Cfz :e $HOME/.zshrc
command! -bang -nargs=? -complete=dir Cfp :e $HOME/.zprofile
command! -bang -nargs=? -complete=dir Cfxp :e $HOME/.xprofile
command! -bang -nargs=? -complete=dir Cfxx :e $HOME/.Xresources
command! -bang -nargs=? -complete=dir Cfv :e $XDG_CONFIG_HOME/nvim/init.vim
command! -bang -nargs=? -complete=dir Cfr :e $XDG_CONFIG_HOME/ranger/rc.conf
command! -bang -nargs=? -complete=dir Cfma :e $OS/autoInstallSudo\ -E
command! -bang -nargs=? -complete=dir Cfa :e $XDG_CONFIG_HOME/zshPlugAlias

" nnoremap <leader><space>cfv :Cfv<cr>
" nnoremap <leader><space>cfz :Cfz<cr>
" nnoremap <leader><space>cfp :Cfp<cr>
" nnoremap <leader><space>cfr :Cfr<cr>
" nnoremap <leader><space>cfxp :Cfxp<cr>
" nnoremap <leader><space>cfxx :Cfxx<cr>
" nnoremap <leader><space>cfma :Cfma<cr>
" nnoremap <leader><space>cfa :Cfa<cr>

" clear search highlights
noremap <silent><leader>ll :nohlsearch<bar>match none<bar>2match none<bar>3match none<Esc>
" nnoremap <silent><leader>hh :execute 'match DiffAdd /\<<c-r><c-w>\>/'<cr>
nnoremap <silent><leader>l1 :execute 'match DiffAdd /\<<c-r><c-w>\>/'<cr>
nnoremap <silent><leader>l2 :execute '2match DiffChange /\<<c-r><c-w>\>/'<cr>
nnoremap <silent><leader>l3 :execute '3match IncSearch /\<<c-r><c-w>\>/'<cr>

" to search only selected text with * and #
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'),'\n','\\n','g')
  let @@ = temp
endfunction

" GIST
" requires gist installed
" you need to do gist --login for the first time
vnoremap <leader>G :w !gist -p -t %:e \| xsel -b<cr>
nnoremap Q gqip
" to source your init.vim (only one line)
vnoremap <silent><leader>S y:execute @@<cr>
nnoremap <silent><leader>S ^vg_y:execute @@<cr>
noremap <leader>0 :Colors<cr>

" help current word
nnoremap gw :h <c-r>=expand('<cword>')<cr><bar>resize 15<cr>

" nnoremap <silent><leader>cp :silent call FormatMyCode()<cr>
nnoremap <silent><leader>cP :silent call FormatMyCode()<cr>
autocmd BufNewFile *.cpp,*.c,*.java call FormatMyCode()

function! FormatMyCode()
  execute '!$APPS/vim/programming/formatCode ' . g:extension .' '. expand('%:p')
  :CocRestart
endfunction

cnoreabbrev Sne CocCommand snippets.editSnippets

" this is to exit select mode when using snips
snoremap <Esc> <c-c>

nmap <leader>.l :!$PROJECTS/Micro/Lily58/qmk_firmware/bin/qmk flash -kb lily58 -km mine-def<cr>
