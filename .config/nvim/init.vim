"cgn change <highlighted item>, useful when you searched something
"install plugs
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
"
"expand('%:p:h')  for directory of file
"shellescape: has 2 uses, in system() and in :!. pass 1 for :! commands so it escapes the quotes, and dont pass anything for system()
"commands
"
" see operator pending mappings (omap) for keybinding mappings
"
"SEE WHAT KEYS ARE MAPPED!
":verbose imap <leader>
":verbose nmap <localleader>
":verbose xmap <leader>
"
set shell=/bin/bash
let mapleader = " "
let maplocalleader = ','
set updatetime=1500 " this is for autosave in tex files(every cursorhold event)


"to install python3 in checkhelath
"python3 -m pip install --user --upgrade pynvim
"pip3 install neovim-remote
"
set encoding=utf-8
scriptencoding utf-8

"setlocal spell
" set spelllang=es
set spelllang=en_us
"set spelllang=en_us

" whichkey
set timeoutlen=1500
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
syntax on
filetype plugin indent on
" set foldmethod=indent
set foldmethod=manual
" set foldcolumn=1
set wildmode=longest,list,full
set expandtab "makes tab work as spaces
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
set noshowmode
set clipboard=unnamedplus
" to  select and move cursor
set mouse=a


"detect root in git repo
if executable('rg')
    let g:rg_derive_root='true'
endif

"================
" PLUGINS
"================
source ~/.config/nvim/modules/plugins.vim

" fix colors for highlighting spelling mistakes
autocmd ColorScheme gruvbox hi SpellBad cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828

" Theme
"colorscheme onehalfdark
"colorscheme dracula
colorscheme gruvbox
"try codedark
" colorscheme wal
"set background=dark
"
"for transparent vim
hi Normal guibg=NONE ctermbg=NONE

" sets 24 bit term colors for vim
set termguicolors

"Cursor highlight groups
"Cursor CursorIM CursorColumn CursorLine


" airline
"let g:airline_theme='onehalfdark'
"let g:airline_theme='gruvbox'
"show buffers active on top
"let g:airline#extensions#tabline#enabled = 1
"
"
"Themes
"https://github.com/vim-airline/vim-airline/wiki/Screenshots
"
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
"https://ncona.com/2019/02/the-vim-statusline/

"=====================
" KEYBINDINGS
"=====================

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
noremap <localleader><Tab> <Esc>/<++><Enter>"_c4l
inoremap <localleader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <localleader><Tab> <Esc>/<++><Enter>"_c4l

" general insert commands
" inoremap ;g <++>
inoremap <localleader>g <++>

" shell
noremap <leader>rb i#!/bin/sh<CR><CR>

" Alias replace all to
nnoremap <A-s> :%s//gI<Left><Left><Left>
" save with no permission using w!!, could be cnoremap
cmap w!! w !sudo tee > /dev/null %

map <leader>rs :!./%<cr>
noremap <c-n> <c-y>
map  <c-w>+ 5<c-w>-
map  <c-w>- 5<c-w>+
map  <c-w>< 5<c-w>>
map  <c-w>> 5<c-w><
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
"----------
"AUTOMATION
"----------

" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
" Vertically center document when entering insert mode
autocmd InsertEnter * norm zz

" open browser in current file folder
map <leader>ra :!setsid st ranger $(dirname %) 2>/dev/null <cr>

"bufwritepost  is when you save them
"bufreadpost  is when you open them

" Utilities
" auto save if is a python file
   " autocmd BufReadPost *.py :call Autosaving()
   "
" commenting in python
"    autocmd FileType python     nnoremap <buffer> gcc I#<esc>

" commenting in c,cpp
"    autocmd FileType c,cpp     nnoremap <buffer> gcc I//<esc>

" auto compile status bar dwm
    autocmd BufWritePost dwmstatus :!killall dwmstatus; setsid dwmstatus &

" auto compile suckless programs MODIFY TO GET BORDER
    " autocmd BufWritePost config.h !cd $(compileSuckless %); sudo make clean install
    autocmd BufWritePost config.h :call CompileSuck()

    function CompileSuck()
        let path = expand('%:p:h')
        let name = system('basename '.shellescape(path))
        " exec 'echo '.shellescape(name)
        silent exec '!cd ' . shellescape(path)
        if name =~ "dwm-6.2"
            echo name
            :exec '!changeWallpaperKeepBorders'
        else
            :exec '!sudo make clean install'
        endif



    endfunction
" auto compile latex if no vimtex
    autocmd BufWritePost,CursorHold,CursorHoldI *.tex :call CompileTex()

" auto compile markdown
    autocmd BufWritePost *.md :call CompileMd()

    function CompileTex()
        :w | silent exec "!latexmk -pdf %"
    endfunction

    function CompileMd()
        " the space at the end .pdf " is caused by the \n character
        let file = expand('%:p')

        let destinationFile = system("printf \"$(basename ". file. " .md).pdf\"")
        let destinationPath = expand('%:p:h')
        let destination = destinationPath .'/'. destinationFile

        let run = system("compileMd ".file." ".destination)
        if v:shell_error == 0
            :exec "!setsid zathura " . shellescape(destination)
        endif
    endfunction

" auto compile vim
    autocmd BufWritePost *.vim source %

" auto compile xresources
    autocmd BufWritePost *.Xresources !xrdb ~/.Xresources

" auto compile sxhkd
    autocmd BufWritePost *sxhkdrc !pkill sxhkd; setsid sxhkd &

" auto shortcuts
    autocmd BufWritePost,TextChanged sf,sd !$AUTOMATION/shortcut_maker_better

" functions
function Autosaving()
    autocmd TextChanged,TextChangedI <buffer> silent! write
endfunction

" UndoTreeToggle
map <leader>u :UndotreeToggle<CR>

" NERDTreeToggle
map <leader>se :NERDTreeToggle<CR>
let NERDTreeMenuUp   = 'e'
let NERDTreeMenuDown = 'n'
let NERDTreeMapOpenExpl = 'k'

" Undo tree
nnoremap <F5> :UndotreeToggle<cr>

" fzf
" for rg
let g:rg_derive_root='true'
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
nnoremap <c-p> :PFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>gp :GFiles<cr>
nnoremap <leader>gl :BCommits<cr>
nnoremap <leader>f :Rg<cr>
nnoremap <F4> :Course<cr>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" gives a preview window to Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" to start fzf at root of project
command! PFiles execute 'Files' s:find_current_root()

function! s:find_current_root()
    execute ':lcd %:p:h'
    return system('git status') =~ '^fatal:' ?
                \ expand("%:p:h") : system("git rev-parse --show-toplevel 2> /dev/null")[:-2]
endfunction


" for ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'dir': s:find_current_root()}), <bang>0)

"search in specific folder"
command! -bang Course call fzf#vim#files('~/Documents/Learn/languages', <bang>0)

"Or, if you want to override the command with different fzf options, just pass a custom spec to the function.
"command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)


" GoTo code navigation.
"nmap <leader>gd <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap gr <Plug>(coc-references)
nmap gi <Plug>(coc-implementation)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
nnoremap <silent> <leader>+ :call CocAction('doHover')<cr>
nmap <F2> <Plug>(coc-rename)


    " \ 'coc-html',
    " \ 'coc-prettier',
    " \ 'coc-json',
 let g:coc_global_extensions = [
    \ 'coc-marketplace',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-vimtex',
    \ 'coc-python',
    \ 'coc-sh',
    \ 'coc-tslint-plugin',
    \ ]

 " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

 " Use `[g` and `]g` to navigate diagnostics (errors)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" ultisnips
let g:UltiSnipsExpandTrigger='<c-s>' " TO USE SNIPPETS
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

"Coc-snippets
"to scroll with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
"imap <C-l> <Plug>(coc-snippets-expand)


" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_mappings_enabled=1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}

let g:vimtex_mappings_disable= {
        \ 'n': ['ic', 'id', 'ie', 'i$'],
        \ 'x': ['ic', 'id', 'ie', 'i$'],
        \ 'o': ['ic', 'id', 'ie', 'i$'],
        \}

" none of these overrides worked
"
" let g:vimtex_mappings_override_existing=1

" augroup vimtexBindings
"     autocmd!
"     autocmd FileType tex xmap <buffer> ;c <plug>(vimtex-ic)
"     autocmd FileType tex nmap <buffer> ;c <plug>(vimtex-ic)
"     autocmd FileType tex omap <buffer> ;c <plug>(vimtex-ic)

"     autocmd FileType tex xmap <buffer> ;d <plug>(vimtex-id)
"     autocmd FileType tex nmap <buffer> ;d <plug>(vimtex-id)
"     autocmd FileType tex omap <buffer> ;d <plug>(vimtex-id)

"     autocmd FileType tex xmap <buffer> ;e <plug>(vimtex-ie)
"     autocmd FileType tex nmap <buffer> ;e <plug>(vimtex-ie)
"     autocmd FileType tex omap <buffer> ;e <plug>(vimtex-ie)

"     autocmd FileType tex xmap <buffer> ;$ <plug>(vimtex-i$)
"     autocmd FileType tex nmap <buffer> ;$ <plug>(vimtex-i$)
"     autocmd FileType tex omap <buffer> ;$ <plug>(vimtex-i$)
" augroup END

"tex conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

"COC
map <leader>,p :CocCommand python.setInterpreter<cr>
 " call coc#config('python', {
 "  \   'jediEnabled': v:false,
 "  \   'pythonPath': split(execute('!which python3'), '\n')[-1]
 "  \ })

" nerdcommenter
"nnoremap gc :call NERDComment(0,"toggle")<CR>
"vnoremap gc :call NERDComment(0,"toggle")<CR>

" Goyo

nnoremap <leader>gg :Goyo \| set wrap \| set linebreak<CR>
"nnoremap <leader>gd :Goyo! \| :set wrap! \| :set linebreak!<CR>


" Haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"IndentLine
"
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0


" enable vertical lines in javascript and typescript files
function VerticalLines()
    :IndentLinesToggle
    set shiftwidth=2
endfunction
autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter *.js,*.ts :call VerticalLines()
"these 2 only work with real tabs, not expanded tabs"
"set listchars=tab:┆.,trail:.,extends:>,precedes:<
"set list
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" prettier
" nmap <Leader>p <Plug>(Prettier)
nmap <Leader>p :call Formatting()<cr>

function Formatting()
" the [:-2] is to take away the last new line character
    let extension = expand('%:e')
    if extension =~ "js"
        :Prettier
        return
    else
    if extension =~ "py"
        echo worked
        :call CocAction('format')
        return
    endif
    :!clear && shellcheck %<CR>
    endif
endfunction

" easymotion"
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" devicons
" let g:webdevicons_enable = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsEnableFolderExtensionPatternMatching = 1

" targets plugin
"

let g:targets_aiAI = 'alAL'
let g:targets_mapped_aiAI = 'aiAI'
let g:targets_nl = 'ni'
" let g:targets_aiAI = ['<Space>a', '<Space>l', '<Space>A', '<Space>L']
" let g:targets_mapped_aiAI = ['<Space>a', '<Space>l', '<Space>A', '<Space>L']
"
"this script lets you apply macros to multiple lines
source ~/.config/nvim/modules/visual-at.vim

" macros
let @a = 'fxa.testing0lbeggining'
    " whenever it finds an x, it runs this macro
    " normal or norm is an ex command (a colon command, like :help)
nnoremap <leader>ri :g/x/normal @a<cr>

" close tags
"
" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,jsx,ts,tsx,xml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,ts,js,html,xml'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'


" load folds that you did previously, breaks which-key
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
