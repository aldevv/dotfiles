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
noremap k nzzzv
noremap K Nzzzv
nnoremap <leader>- :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>
" noremap N J
noremap J E
vnoremap i l
vnoremap l i
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
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    copen
    execute "normal! \<c-w>k"
  else
    cclose
  endif
endfunction

nnoremap <leader>z zMzvzz

nnoremap <silent><leader>,c  :!chmod +x %<cr>



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
function! EnterFileName()
    call inputsave()
    let l:filename = input("Enter Filename: ")
    call inputrestore()
    if len(l:filename) == 0
        return
      endif
    exe ":e " . l:filename
    w
    startinsert
endfunction

function! EnterDirName()
    call inputsave()
    let l:filename = input("Enter Folder Name: ")
    call inputrestore()
    if len(l:filename) == 0
        return
      endif
    exe ":!mkdir " . l:filename
    w
    startinsert
endfunction

" create files and folders
nnoremap <leader>sn  :call EnterFileName()<cr>
nnoremap <leader>sm  :call EnterFolderName()<cr>

" close buffers
noremap <leader>sd :bd<cr>
noremap <a-q> :bd<cr>

" change buffers like bscode
" noremap <silent>N :bprevious<cr>
" noremap <silent>E :bnext<cr>

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
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P
nmap <leader>gp "+gp
" copy default register into the main clipboard
nnoremap <silent> <leader>. :let @+ = @"<cr>

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

" open terminal
" map <Leader>st :new term://zsh \| resize 10<CR>a

"To map <Esc> to exit terminal-mode:
tnoremap <a-t> <C-\><C-n>

" exit terminal mode
" tmap <silent><a-q> <a-t>:q<cr>
tmap <silent><a-q> <a-t>:Ttoggle<cr>

" go up from terminal
tmap <a-d> <a-t><c-w>k
map <a-d> <c-w>ja

" general insert commands
inoremap <a-m> <++>
"" Guide navigation
noremap <a-k> <Esc>/<++><Enter>"_c4l
inoremap <a-k> <Esc>/<++><Enter>"_c4l
vnoremap <a-k> <Esc>/<++><Enter>"_c4l


" shell
noremap <leader>rb i#!/bin/sh<CR><CR>

"global do
nnoremap <A-R> :%g/\v//norm!<Left><Left><Left><Left><Left><Left><Left>
nnoremap <A-r> :%norm!<space>
vnoremap <A-R> :g/\v//norm!<Left><Left><Left><Left><Left><Left><Left>
vnoremap <A-r> :norm!<space>

" Alias replace all to
nnoremap <A-s> :%s/\v//gI<Left><Left><Left><Left>
vnoremap <A-s> :s/\v//gI<Left><Left><Left><Left>
vnoremap <A-S> :s/\v//gI<Left><Left><Left><Left>
" save with no permission using w!!, could be cnoremap
"
cnoreabbrev w!! w !sudo tee > /dev/null %

map <leader>rs :!./%<cr>
map <silent> <F11> /\A\zs\a<cr>
" ctrl alt
noremap <M-C-N> <c-e>
noremap <M-C-E> <c-y>

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
nnoremap <M-i> <c-i>
nnoremap <M-o> <c-o>


" noremap <c-i> <c-i>
" set <tab>=^[
" noremap <TAB> <tab>


nnoremap <leader>ss <c-w>s
nnoremap <leader>sv <c-w>v
" map <leader>i :setlocal autoindent<cr>
" map <leader>I :setlocal noautoindent<cr>
map  <silent><leader>q :silent w !sudo tee %<CR>
map  <leader>t :w<CR>
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
cnoremap <C-j> <Left>
cnoremap <C-l> <Down>
cnoremap <C-u> <Up>
cnoremap <C-y> <Right>

" map <silent> <leader>RR :call Runner()<cr>
" autocmd FileType python map <silent> <cr> :call Runner()<cr>
" autocmd FileType python nnoremap <buffer> <s-cr> :silent w<bar>only<bar>vsp<bar>term ipython3 -i %<cr>
autocmd FileType python nnoremap <buffer> <s-cr> :silent w<bar>only<bar>vsp<bar>term jupyter console<cr> <c-w>l :JupyterConnect<cr><cr> :JupyterRunFile<cr>
autocmd FileType java nnoremap <silent><buffer> <s-cr> :silent w<bar>execute "!java ".expand('%:t:r')<cr>
noremap <silent><leader><cr> :call Runner('noquickfix')<cr>
nnoremap <silent><cr> :call RunnerEnter()<cr>

function! RunnerEnter()
  " if &buftype ==# 'nofile'
  if bufname('%') == ''
    execute "normal! \<CR>"
  else
    :call Runner('')
  endif
endfunction
function Runner(background)
  exec 'silent w'
  let l:runner = 'Dispatch '
  if a:background == 'noquickfix'
    let l:runner ='! '
  endif

  let extension = expand('%:e')
  let dict =
        \{
        \ 'py': "python3 %",
        \ 'c': "gcc %  && ./a.out",
        \ 'cpp': "g++  % && ./a.out",
        \ 'js': "node %",
        \ 'ts': "node %",
        \ 'java': "javac % && java ".expand('%:t:r'),
        \ '': "chmod +x %; ./%"
        \}
  " execute '!'.dict[extension]
  execute l:runner . dict[extension]
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
map <silent><leader>,f :silent execute '!fcc' shellescape(&ft)<cr>
nnoremap <leader>V V`]

command! -bang -nargs=? -complete=dir Cfz :e $HOME/.zshrc
command! -bang -nargs=? -complete=dir Cfp :e $HOME/.zprofile
command! -bang -nargs=? -complete=dir Cfxp :e $HOME/.xprofile
command! -bang -nargs=? -complete=dir Cfxx :e $HOME/.Xresources
command! -bang -nargs=? -complete=dir Cfv :e $XDG_CONFIG_HOME/nvim/init.vim
command! -bang -nargs=? -complete=dir Cfr :e $XDG_CONFIG_HOME/ranger/rc.conf

nnoremap <leader>,ev :Cfv<cr>
nnoremap <leader>,ez :Cfz<cr>
nnoremap <leader>,ep :Cfp<cr>
nnoremap <leader>,er :Cfr<cr>
nnoremap <leader>,exp :Cfxp<cr>
nnoremap <leader>,exx :Cfxx<cr>

" Make double-<Esc> clear search highlights
noremap <silent><leader>hh :nohlsearch<bar>match none<bar>2match none<bar>3match none<Esc>
" nnoremap <silent><leader>hh :execute 'match DiffAdd /\<<c-r><c-w>\>/'<cr>
nnoremap <silent><leader>h1 :execute 'match DiffAdd /\<<c-r><c-w>\>/'<cr>
nnoremap <silent><leader>h2 :execute '2match DiffChange /\<<c-r><c-w>\>/'<cr>
nnoremap <silent><leader>h3 :execute '3match IncSearch /\<<c-r><c-w>\>/'<cr>

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
vnoremap <leader>G :w !gist -p -t %:e \| xclip -selection clipboard<cr>
nnoremap Q gqip
" to source your init.vim (only one line)
vnoremap <silent><leader>S y:execute @@<cr>
nnoremap <silent><leader>S ^vg_y:execute @@<cr>
noremap <leader>0 :Colors<cr>

" help current word
nnoremap gw :h <c-r>=expand('<cword>')<cr><bar>resize 15<cr>

