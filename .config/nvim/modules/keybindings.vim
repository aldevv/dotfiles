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
noremap k n
noremap K N
noremap N J
noremap J E
vnoremap i l
vnoremap l i
vnoremap L I
noremap ge J
noremap gn i<cr><esc>k$
" nnoremap <CR> o<Esc>
" nnoremap <S-CR> O<Esc>
nnoremap [13;2u o

noremap - /
noremap / -

nnoremap <silent><leader>lch  :!chmod +x %<cr>

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

nnoremap <silent> <leader>z :call ToggleFMethod()<cr>
function ToggleFMethod()
  let method=&foldmethod
  if method == "expr"
    set foldmethod=manual
  else
    set foldmethod=expr
  endif
endfunction

" this didnt work because it needs to be put down lower, but is a good example
" of how to obtain input for a command
"
" function s:FileName()
"     call inputsave()
"     let g:createdFile = input("File name: ")
"     call inputrestore()
"     :e <C-r>=createdFile<CR>
"     :NERDTreeRefreshRoot<CR>
" endfunction
" " nnoremap <F1> oHello, <C-\><C-o>:call <SID>FileName()<CR><C-r>=createdFile<CR>. nice name.<ESC>
" nnoremap <leader>sn  :call <SID>FileName()<CR> :e <C-r>=createdFile<CR>

noremap <leader>n <s-n>
noremap <leader>sd :bd<cr>
noremap <c-w> :bd<cr>
noremap <silent>N :bprevious<cr>
noremap <silent>E :bnext<cr>

" clipboard
" "*p pastes what is highlighted by the mouse
" ""p and "0p are the default registers
"
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
nnoremap <leader>ct :!ctags -R


" noremap gss !python2 -c "import sys; print(sys.stdin.read())"<cr>
"https://stackoverflow.com/questions/40072761/vim-send-visual-block-to-external-command
"added B and S (vis plugin)
"B for applying commands to the visually selected area and only to that visual area
"S is for searching stuff ONLY in the visually selected area
vnoremap <silent><leader> gs :B !sortList.py <cr>t]xT[
vnoremap <silent><leader> gr :B !sortListR.py <cr>t]xT[


nnoremap gñ :SyntaxQuery<CR>
nnoremap <leader>lt :silent call Toggle_transparent()<CR>
function Toggle_transparent()
  exec ":!toggleTrans"
endfunction

" open terminal
map <Leader>st :new term://zsh \| resize 10<CR>

"To map <Esc> to exit terminal-mode:
tnoremap <a-t> <C-\><C-n>

"" Guide navigation
noremap <a-k> <Esc>/<++><Enter>"_c4l
inoremap <a-k> <Esc>/<++><Enter>"_c4l
vnoremap <a-k> <Esc>/<++><Enter>"_c4l

" general insert commands
" inoremap ;g <++>
inoremap <a-m> <++>

" shell
noremap <leader>rb i#!/bin/sh<CR><CR>

" Alias replace all to
nnoremap <A-s> :%s///gI<Left><Left><Left><Left>
" save with no permission using w!!, could be cnoremap
cmap w!! w !sudo tee > /dev/null %

map <leader>rs :!./%<cr>
map <silent> <F11> /\A\zs\a<cr>
noremap <c-n> <c-e>
noremap <c-e> <c-y>

noremap  <Down> 5<c-w>-
noremap  <Up> 5<c-w>+
noremap  <Right> 5<c-w>>
noremap  <Left> 5<c-w><
" noremap  N 5<c-w>-
" noremap  E 5<c-w>+
" noremap  + 5<c-w>>
" noremap  - 5<c-w><
nnoremap <leader>h <c-w>h
nnoremap <leader>n <c-w>j
nnoremap <leader>e <c-w>k
nnoremap <leader>i <c-w>l
nnoremap <leader>ss <c-w>s
nnoremap <leader>sv <c-w>v
" map <leader>i :setlocal autoindent<cr>
" map <leader>I :setlocal noautoindent<cr>
map  <leader>T :w !sudo tee %<CR>
map  <leader>t :w<CR>
map  <leader>q :wq<CR>
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
nnoremap <silent><cr> :call RunnerEnter()<cr>

function! RunnerEnter()
  if &buftype ==# 'quickfix'
    execute "normal! \<CR>"
  else
    :call Runner()
  endif
endfunction
function Runner()
  exec 'silent w'
  let extension = expand('%:e')
  let dict =
        \{
        \ 'py': ":!python3 %",
        \ 'c': ":!gcc %  && ./a.out",
        \ 'cpp': ":!g++  % && ./a.out",
        \ 'js': ":!node %",
        \ 'ts': ":!node %",
        \ 'java': "!javac % && java ".expand('%:t:r'),
        \ '': ":!chmod +x %; ./%"
        \}
  execute dict[extension]
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
autocmd FileType python,java,js,jsx,ts iabbrev <buffer> rt return
autocmd FileType python,java,js,jsx,ts iabbrev <buffer> fa False
autocmd FileType python,java,js,jsx,ts iabbrev <buffer> tr True
autocmd FileType python,java,js,jsx,ts iabbrev <buffer> br Break

" use * in visual mode
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>
