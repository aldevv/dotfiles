noremap n j
noremap e k
noremap j e
nnoremap l i
nnoremap i l
noremap k n
noremap K N
noremap N J
nnoremap L I
vnoremap i l
vnoremap L I
"fold
noremap ze zk
noremap zn zj
noremap zD zE
noremap z[ [z
noremap z] ]z

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
nnoremap <A-s> :%s//gI<Left><Left><Left>
" save with no permission using w!!, could be cnoremap
cmap w!! w !sudo tee > /dev/null %

map <leader>rs :!./%<cr>
noremap <c-n> <c-y>
noremap  N 5<c-w>-
noremap  E 5<c-w>+
noremap  + 5<c-w>>
noremap  - 5<c-w><
nnoremap <leader>h <c-w>h
nnoremap <leader>n <c-w>j
nnoremap <leader>e <c-w>k
nnoremap <leader>i <c-w>l
nnoremap <leader>s <c-w>s
nnoremap <leader>v <c-w>v
" map <leader>i :setlocal autoindent<cr>
" map <leader>I :setlocal noautoindent<cr>
map  <leader>W :w !sudo tee %<CR>
map  <leader>w :w<CR>
map  <leader>q :wq<CR>
map <F6> :e ~/.config/nvim/init.vim<cr>
map <F3> :e ~/.zshrc<cr>
map <C-&> <C-^>
" noremap  <leader>ww :w<CR>
noremap  ! :!
noremap  <F7> :set spell! \| set wrap<CR>

map ñ :

" Ctrl-O lets you do just one command in insert mode

inoremap <C-j> <Left>
inoremap <C-l> <Down>
inoremap <C-u> <Up>
inoremap <C-y> <Right>
cnoremap <C-j> <Left>
cnoremap <C-l> <Down>
cnoremap <C-u> <Up>
cnoremap <C-y> <Right>

map <silent> <leader>rr :call Runner()<cr>
function Runner()
    exec 'silent w'
    let extension = expand('%:e')

    if extension == "c"
         :!gcc %  && ./a.out
    endif

    if extension == "cpp"
         :!g++  % && ./a.out
    endif

    if extension == "py"
        :!python3 %
    endif
endfunction
