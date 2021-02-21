"==========
"Themes
"==========
"https://github.com/vim-airline/vim-airline/wiki/Screenshots
"
" let g:airline_theme='luna'
" let g:airline_theme='gruvbox'
"
set termguicolors
if exists('+termguicolors')
    set t_8f=\[[38;2;%lu;%lu;%lum
    set t_8b=\[[48;2;%lu;%lu;%lum
endif

set pumblend=15
" Theme
"colorscheme onehalfdark
"try codedark
"
"(gruvbox dracula monokai codedark ayu)
let color_options = {
            \ "gruvbox":0,
            \ "dracula":1,
            \ "monokai":2,
            \ "onehalfdark":3,
            \ "ayu":4,
            \}
let current_colorscheme = color_options["ayu"]
if current_colorscheme == 0
    let g:gruvbox_invert_selection = '0'
    " let g:airline_theme='gruvbox'
    let g:airline_theme='minimalist'
    "soft medium hard
    let g:gruvbox_contrast_dark = "hard"
    " not sure what this does
    let g:gruvbox_improved_warnings = 1
    colorscheme gruvbox
    " fix colors for highlighting spelling mistakes
    autocmd ColorScheme gruvbox hi! SpellBad cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828
endif
if current_colorscheme == 1
    colorscheme dracula
    let g:dracula_italic = 1
    let g:airline_theme='dracula'
endif
if current_colorscheme == 2
    colorscheme monokai
    let g:airline_theme='monokai'
    let g:monokai_term_italic = 1
    let g:monokai_gui_italic = 1
endif
if current_colorscheme == 3
    " colorscheme onehalflight
    colorscheme onehalfdark
    let g:airline_theme='onehalfdark'
    " lightline
    " let g:lightline = { 'colorscheme': 'onehalfdark' }
endif
if current_colorscheme == 4
    let ayu_comment_italic=0 " enable italic for comments
    let ayu_string_italic=0  " enable italic for strings
    let ayu_type_italic=1    " enable italic for types
    let ayu_keyword_italic=1 " enable italic for keywords
    " let ayucolor="light"  " for light version of theme
    " let ayucolor="mirage" " for mirage version of theme
    let ayucolor="dark"   " for dark version of theme
    let g:airline_theme='ayu'
    colorscheme ayu
endif
set background=dark
" ==============
" UndoTreeToggle
" ==============
map <silent><leader>u :UndotreeToggle<CR>

" NERDTreeToggle
" check mappings here
"https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt
let g:nerdFirsttime = 0
function s:UpdateNerd() " updates the  tree when a new file is saved
    if g:nerdFirsttime == 0
        if exists("g:NERDTree") && g:NERDTree.IsOpen()
            autocmd BufWritePost * :NERDTreeRefreshRoot
        endif
    endif
    let g:nerdFirsttime = 1
    :NERDTreeRefreshRoot
endfunction
" map <leader>se :NERDTreeToggle<CR>:call <SID>UpdateNerd()<CR>
noremap <silent><leader>se :NERDTreeToggle<CR>:call <SID>UpdateNerd()<CR>



" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" close vim if only nerdtree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" to avoid crashes with vim-plug functions while cursor in nerdtree
let NERDTreeShowHidden=1
let g:plug_window = 'noautocmd vertical topleft new'
let NERDTreeShowHidden=1

let NERDTreeMenuUp   = 'e'
let NERDTreeMenuDown = 'n'

let NERDTreeMapOpenExpl = 'k'
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapPreview = "o"
let NERDTreeMapOpenRecursively= "I"
let NERDTreeMapCloseChildren = "H"
let NERDTreeMapActivateNode = "go"
let NERDTreeMapOpenVSplit = "v"
let NERDTreeMapPreviewSplit = "gs"
let NERDTreeMapPreviewVSplit = "gv"
let NERDTreeMapJumpFirstChild = "E"
let NERDTreeMapJumpLastChild = "N"
let NERDTreeMapJumpPrevSibling = "<C-E>"
let NERDTreeMapJumpNextSibling = "<C-N>"
let NERDTreeMapToggleHidden = "<BS>"
" you can open with o
let NERDTreeMapCustomOpen = "i"

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹ ',
            \ 'Staged'    :'➕',
            \ 'Untracked' :'✭ ',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }

" =========
" Undo tree
" =========
nnoremap <F5> :UndotreeToggle<cr>

" =======
" FZF
" =======
" call fzf#vim#complete#path($FZF_DEFAULT_COMMAND)
" \ 'ctrl-t': 'tab split',
let g:fzf_action = {
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-o': 'silent !setsid st -e nvim 2>/dev/null' } " sends it to other nvim instance
" for rg
let g:rg_derive_root='true'
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
nnoremap <a-p> :Filescwd<cr>
nnoremap <a-P> :GFiles<cr>
nnoremap <c-p> :Buffers<cr>
nnoremap <C-S-P> :Commits<cr>
  command! -bang Commits call fzf#vim#commits({'options': '--no-preview'}, <bang>0)
nnoremap <leader>C :Commands<cr>
nnoremap <c-c>m :Maps<cr>
nnoremap <leader>,fms :FilesScripts<cr>
nnoremap <leader>,fsp :FilesSnips<cr>
nnoremap <leader>,fh :FilesHome<cr>
nnoremap <leader>,fwo :FilesWork<cr>
nnoremap <leader>,fcc :FilesClass<cr>
nnoremap <leader>,fpo :FilesProjects<cr>
nnoremap <leader>,fpr :FilesPrograms<cr>
nnoremap <leader>,fcf :FilesDots<cr>
nnoremap <leader>,fmo :FilesOs<cr>
nnoremap <leader>sN :RemoveFiles<cr>
nnoremap <leader>sF :RemoveDirs<cr>
"made myself
nnoremap <leader>,b :Bookm<cr>
nnoremap <leader>sb :Buffers<cr>
let g:vista_default_executive = 'ctags'
nnoremap <F4> :Course<cr>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'



" gives a preview window to Files in Home
command! -bang -nargs=? -complete=dir FilesScripts
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$SCRIPTS, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesHome
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$HOME, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesWork
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$WORK, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesClass
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$CLASS, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesProjects
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$PROJECTS, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesDots
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$XDG_CONFIG_HOME, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesLearn
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$LEARN, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesPrograms
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$PROGRAMS, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

command! -bang -nargs=? -complete=dir FilesOs
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':$OS, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

let snips_folder=$XDG_CONFIG_HOME."/nvim/my_snippets"
command! -bang -nargs=? -complete=dir FilesSnips
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'dir':snips_folder, 'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" gives a preview window to Files
command! -bang -nargs=? -complete=dir Filescwd
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline'], 'dir': getcwd()}), <bang>0)

" overwrites GFILES (user git-ls which doesn't find files not in repo)
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" to start fzf at root of project
command! GFiles execute 'Files' s:find_current_root()

function! s:find_current_root()
    execute ':lcd %:p:h'
    return system('git status') =~ '^fatal:' ?
                \ expand("%:p:h") : system("git rev-parse --show-toplevel 2> /dev/null")[:-2]
endfunction

" function! SpecialWindow()
"   return &buftype == 'quickfix' || &buftype == 'nofile'
" endfunction

function RemoveFileUpdateNerdtree(files)
  exec system('rm ' . a:files)
  if !SpecialWindow()
    :w
  endif
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction
let remove_files_command = "rg --files -u -u --no-heading --smart-case --follow -g '!{**/node_modules/*,*.class,**/.git/*,miniconda3/*,**/*~,plugged/**,env,envs,__pycache__,libs,lib,.wine,.npm,.icons,.vscode,*/nvim/backups,.emacs.d/**,.cache,**/undodir/*}' --""
command! -bang -bar -complete=dir RemoveFiles
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(
            \ {
            \   'source': remove_files_command,
            \   'sink': function('RemoveFileUpdateNerdtree'),
            \   'options': ['--layout=reverse', '--info=inline']
            \ }), <bang>0)

function RemoveDirUpdateNerdtree(dir)
  exec system('rm -r ' . a:dir)
  if !SpecialWindow()
    :w
  endif
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeRefreshRoot
  endif
endfunction
let remove_dir_command = "fd -t d -H -d 1""
command! -bang -bar -complete=dir RemoveDirs
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(
            \ {
            \   'source': remove_dir_command,
            \   'sink': function('RemoveDirUpdateNerdtree'),
            \   'options': ['--layout=reverse', '--info=inline']
            \ }), <bang>0)

" for ripgrep
" command! -bang -nargs=* Rgfzf
"             \ call fzf#vim#grep(
"             \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
"             \   fzf#vim#with_preview({'window':{'width':1,  'height':0.7},'dir': s:find_current_root()}), <bang>0)
let rg_command_nofiles = "rg --column --no-heading --color=always --smart-case --line-number --follow -g '!{**/node_modules/*,*.class,**/.git/*,miniconda3/*,**/*~,plugged/**,env,envs,__pycache__,libs,lib,.wine,.npm,.icons,.vscode,*/nvim/backups,.emacs.d/**,.cache,**/undodir/*}' --"
command! -bang -nargs=* Rgfzf
            \ call fzf#vim#grep(
            \   rg_command_nofiles . ' ' . shellescape(<q-args>), 1,
            \   fzf#vim#with_preview({'window':{'width':1,  'height':0.7},'dir': s:find_current_root()}), <bang>0)
map <leader>f :Rgfzf<cr>

command! -bang -nargs=* Rgfzf2
            \ call fzf#vim#grep(
            \   rg_command_nofiles . ' ' . shellescape(expand('<cword>')), 1,
            \   fzf#vim#with_preview({'window':{'width':1,  'height':0.7},'dir': s:find_current_root()}), <bang>0)
map <leader>F :Rgfzf2<cr>


let commandFiles="awk '{print $2}' ".$XDG_CONFIG_HOME."/shortcuts/sd"
command! -bang -nargs=* Bookm call fzf#run({'source':commandFiles,'sink': 'e'})
"search in specific folder"
command! -bang Course call fzf#vim#files('~/Documents/Learn/languages', <bang>0)

"Or, if you want to override the command with different fzf options, just pass a custom spec to the function.
"command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)
"
" list functions
" nnoremap <leader>ff :FFunc<CR>
" from https://github.com/
" nnoremap <leader>fs :FZFBTags<CR>
" nnoremap <leader>fc :FClass<CR>

"=====
"COC
"=====

nmap <silent><leader>ccp <Plug>(coc-format)
highlight CocErrorHighlight ctermfg=Red  guifg=#ff0000
" \ 'coc-html',
" \ 'coc-json',
" \ 'coc-pairs',
" \ 'coc-tslint-plugin',
" \ 'coc-prettier',
" \ 'coc-ultisnips',
" \ 'coc-yaml',
" for docker compose add to coc-settings
"
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-java-debug',
            \ 'coc-cssmodules',
            \ 'coc-json',
            \ 'coc-tag',
            \ 'coc-vimtex',
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ 'coc-css',
            \ 'coc-vimlsp',
            \ 'coc-python',
            \ 'coc-sh',
            \ 'coc-diagnostic',
            \ 'coc-java',
            \ 'coc-clangd',
            \ 'coc-rls',
            \ 'coc-go',
            \ 'coc-yaml',
            \ 'coc-docker',
            \ ]
" coc-clangd is necessary for c and c++
nmap <silent> <leader>cci :CocInfo<cr>
nmap <silent> <leader>cC  :CocConfig<cr>
nmap <silent> <leader>ccC :CocLocalConfig<cr>
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gD <Plug>(coc-type-declaration)
" nmap <silent> <leader>cp <Plug>(coc-format)
nmap gr <Plug>(coc-references)
nmap <leader>gr <Plug>(coc-references-used)
nmap gR <Plug>(coc-implementation)
" g{ and g} are usable
nnoremap <silent><nowait> <leader>cd  :<C-u>CocDiagnostics<cr>
nmap ; <Plug>(coc-diagnostic-prev)
nmap , <Plug>(coc-diagnostic-next)
nmap <silent> g; <Plug>(coc-diagnostic-prev-error)
nmap <silent> g, <Plug>(coc-diagnostic-next-error)
nmap <silent> g. <Plug>(coc-fix-current)
nnoremap <silent> + :call CocAction('doHover')<cr>
nmap <F2> <Plug>(coc-rename)
nmap <leader>crf :CocSearch <C-R>=expand('<cword>')<cr><cr>
nmap <leader>crf :CocSearch <C-R>=expand('<cword>')<cr>

":CocRebuild                        *:CocRebuild*
" use when you upgrade nodejs

nmap <leader>cl <Plug>(coc-codelens-action)
nmap <leader>+ <Plug>(coc-diagnostic-info)
nmap <leader>* <Plug>(coc-fix-current)
nmap <leader>cA <Plug>(coc-codeaction)
nmap <leader>ca <Plug>(coc-codeaction-line)
vmap <leader>ca <Plug>(coc-codeaction-selected)
nmap <M-CR> <Plug>(coc-codeaction)
nmap <M-S-CR> <Plug>(coc-codeaction-line)
vmap <M-CR> <Plug>(coc-codeaction-selected)
nmap <silent><leader>crr <Plug>(coc-refactor)
cnoreabbrev CS CocSearch
" for static hover glitch
nnoremap <silent><esc> :call coc#float#close_all()<cr>


" or do <c-w>o to close it but it closes other windows as well

" nnoremap <silent> <leader>cs :call CocAction('documentSymbols')<cr>
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ccd  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" Do default action for next item.
nnoremap <silent><nowait> <leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>ccr  :<C-u>CocRestart<cr>
nnoremap <silent><nowait> <leader>ccl  :<C-u>CocOpenLog<CR>
nnoremap <silent><nowait> <leader>ccm  :<C-u>CocList marketplace<CR>
nnoremap <silent><nowait> <leader>cv  :<C-u>CocList --auto-preview outline<cr>

" implemented in coc-fzf
" Find symbol of current document.
" nnoremap <silent><nowait> <leader>ccl  :<C-u>CocListResume<CR>
" nnoremap <silent><nowait> <leader>cce  :<C-u>CocList extensions<cr>
" nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Show commands.
" nnoremap <silent><nowait> <leader>ccc  :<C-u>CocList commands<cr>

" scroll documentation
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"
" noremap <M-C-N> <c-e>
" noremap <M-C-E> <c-y>
noremap <silent><nowait><expr> <M-C-N> coc#float#has_scroll() ? ":call coc#float#scroll(1, 3)\<cr>" : "\<c-e>"
noremap <silent><nowait><expr> <M-C-E> coc#float#has_scroll() ? ":call coc#float#scroll(0, 3)\<cr>" : "\<c-y>"
inoremap <silent><nowait><expr> <M-C-N> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 3)\<cr>" : "\<c-o><c-e>"
inoremap <silent><nowait><expr> <M-C-E> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 3)\<cr>" : "\<c-o><c-y>"
" inoremap <silent><nowait><expr> <M-C-N> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1, 3)\<cr>" : "\<c-o><c-e>"
" inoremap <silent><nowait><expr> <M-C-E> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0, 3)\<cr>" : "\<c-o><c-y>"

" _______________________________________________
"
" CocSearch is very powerful, so you should use it with the many options it has available
" more info in man rg
"
"   `-F` `--fixed-strings`: treat search pattern as fixed string.
"    `-e` `--regexp`: treat search pattern as regexp.
"   `-L` `--follow`: follow symbolic links while traversing directories.
"   `-g` `--glob` {GLOB}: Include or exclude files and directories for
"   searching that match the given glob.
"   `--hidden`: Search hidden files and directories.
"   `--no-ignore-vcs`:  Don't respect version control ignore files
"   (.gitignore, etc.).
"   `--no-ignore`: Don't respect ignore files (.gitignore, .ignore, etc.).
"   `-w` `--word-regexp`: Only show matches surrounded by word boundaries.
"   `-S` `--smart-case`: Searches case insensitively if the pattern is all
"   lowercase. Search case sensitively otherwise.
"   `--no-config`: Never read configuration files.
"   `-x` `--line-regexp`: Only show matches surrounded by line boundaries.


function s:show_hover_doc()
    if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ "\\S"
        silent! call timer_start(1300, 'ShowDocIfNoDiagnostic')
    endif
endfunction

function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#float#has_float() == 0)
        " silent! call CocActionAsync('doHover')
        " non async so it doesnt try to create another one once theres already a rendered one
        silent! call CocAction('doHover')
    endif
endfunction

function Activate_hover()
    " autocmd CursorHoldI * silent! call <SID>show_hover_doc()
    autocmd CursorHold  * silent! call<SID>show_hover_doc()
    " autocmd CursorHold * if ! coc#float#has_float() | silent! call CocActionAsync('doHover') | endif
endfunction

" auto hover, uncomment for enabling
" augroup auto_hovering
"     autocmd!
"     autocmd FileType python,cpp,javascript,c,java :call Activate_hover()
" augroup END


" nnoremap <nowait><expr> <a-e> coc#util#float_scrollable() ? coc#util#float_scroll(0) : "\<c-w>\<c-v>"
nnoremap <nowait><expr><a-n> coc#float#has_scroll() ? coc#float#scroll(1) : OutlineFZF()
nnoremap <nowait><expr><a-e> coc#float#has_scroll() ? coc#float#scroll(0) : BrowseDots()

imap <silent><expr> <a-n> pumvisible() ? "\<C-n>" : "\<C-o>n"
imap <silent><expr> <a-e> pumvisible() ? "\<C-p>" : "\<C-o>e"



function OutlineFZF()
    return ":CocFzfList outline \<cr>"
endfunction

function BrowseDots()
    " return ":FilesDots \<cr>"
    return ":\<C-u>TagbarToggle\<CR>"
endfunction


let g:coc_force_debug = 1
" Use c-n for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" inoremap <silent><expr> <C-n>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ coc#refresh()

" inoremap <expr><C-e> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"
"this one lets you use tab to open popup menu when character before cursor
" inoremap <silent><expr> <TAB>
"    \ pumvisible() ? "\<C-n>" :
"    \ <SID>check_back_space() ? "\<TAB>" :
"    \ coc#refresh()

" inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <CR> pumvisible() && coc#rpc#request('hasSelected', []) ? "\<C-y>" : "\<CR>"

autocmd FileType python call PythonMappings()

function PythonMappings()
    map <leader>Lp :CocCommand python.setInterpreter<cr>
    map <leader>Lr :CocCommand python.execInTerminal<cr>
    map <leader>Ll :CocCommand python.setLinter<cr>
    map <leader>Lg :CocCommand python.viewOutput<cr>
endfunction
" call coc#config('python', {
"  \   'jediEnabled': v:false,
"  \   'pythonPath': split(execute('!which python3'), '\n')[-1]
"  \ })
"
" call coc#config('python', {
              " \ 'formatting.blackPath': $HOME."/.local/bin/black",
            " \})
            " \ 'linting.pylintPath': "usr/bin/pylint"



"=============
"COC-SNIPPETS
"=============
au BufRead,BufNewFile .vimspector.json		set filetype=vimspector.json
"gives me preview of the snippets, and gives me a shortcut to transform snippets quick
"
" Use <leader>x for convert visual selected code to snippet
xmap <leader>cx <Plug>(coc-convert-snippet)

nmap <leader>cx :CocCommand snippets.editSnippets<cr>

" these aren't used

" Use <C-l> for trigger snippet expand.
" imap <c-j> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <a-t> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<a-t>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<a-s>'

" Use <a-t> for both expand and jump (make expand higher priority.)
imap <a-t> <Plug>(coc-snippets-expand-jump)

au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"

" =====================
" Sweet Sweet FuGITive
" =====================
" vimdiff commnads
""]c :        - next difference
"[c :        - previous difference
"do          - diff obtain
"dp          - diff put
"zo          - open folded text
"zc          - close folded text
":diffupdate - re-scan the files for differences
" default diffopt
" set diffopt=internal,filler,closeoff
set diffopt=internal,vertical,closeoff,filler

nmap <leader>gi :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gst :G<CR>
" nnoremap <leader>gst :Gstatus<CR>
nmap <leader>g<space> :G init<CR>

" use ctrl + d to delete branches
" alt + enter to track from origin, locally : origin/ foo becomes foo
" - Press <alt-enter> to track a remote branch locally (`origin/foo` becomes `foo`)
" - Press <ctrl-b> to create a branch or tag with the current query as name
" - Press <ctrl-d> to delete a branch or tag
" - Press <ctrl-e> to merge a branch
" - Press <ctrl-r> to rebase a branch
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>gsp :G stash push<CR>
nnoremap <leader>gsP :G stash pop<CR>
nnoremap <leader>gsl :G stash list<CR>

nnoremap <leader>ggc :G commit<CR>
nnoremap <leader>gm :Git merge<CR>
" nnoremap <leader>gd ::Gvdiff<CR>
nnoremap <leader>ggd ::Gdiffsplit!<CR>
nnoremap <leader>gd ::Gvdiffsplit!<CR>
nnoremap <leader>gD ::Git difftool<CR>
" this works like VS jumper, test to see if i deprecate the other one
nnoremap <leader>gM ::Git mergetool<CR>
nnoremap <leader>gloG :Gclog --reverse<CR>
nnoremap Q :Glog --reverse<CR>
nnoremap <leader>ggp :Git push<CR>
nnoremap <leader>guu :Git pull<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gB :GBrowse<CR>
" nnoremap <leader>gw :Gwrite<CR>
" nnoremap <leader>gr :Gread<CR>
" nnoremap <leader>ga :tab sp \| Gvedit :1 \| windo diffthis<CR>
" for aliases:
" command Gst G
" command Ggc Gcommit
" command Gc Gcheckout
" command Gbl Gblame
" command Ggp Gpush
" command Gf Gfetch
" command Glg Glog --reverse
" command Gm Gmerge
" command Guu Gpull
" command Grb Grebase
" command Grev Grevert
" command Gd Gdiff
" command Gds Gsdiff
" command Gdv Gvdiff
" command Gs Gsplit
" command Gv Gvsplit
" Gremove*
" Gbrowse*
" Gdelete*
" Gmove*
" Grename*
" Git!*
" Gpedit!*
" Gtabsplit!*
""Fugitive extensions
"nnoremap <silent> <leader>gm :tab sp<CR>:Glistmod<CR>
"nnoremap <silent> ]d :call g:DiffNextLoc()<CR>
"nnoremap <silent> [d :call g:DiffPrevLoc()<CR>
"function! g:ViewCommits(num_commits)
"    let commit=0
"    while commit < a:num_commits
"        execute "Gedit HEAD~".commit
"        topleft vsp
"        let commit += 1
"    endwhile
"    q
"endfunction

"command! Glistmod only | call g:ListModified() | Gdiff
"function! g:ListModified()
"    let old_makeprg=&makeprg
"    "let &makeprg = "git diff --cached --name-only"
"    let &makeprg = "git ls-files -m"
"    let old_errorformat=&errorformat
"    let &errorformat="%f"
"    lmake
"    let &makeprg=old_makeprg
"    let &errorformat=old_errorformat
"endfunction

"function! g:DiffNextLoc()
"    windo set nodiff
"    only
"    lnext
"    Gdiff
"endfunction
"function! g:DiffPrevLoc()
"    windo set nodiff
"    only
"    lprevious
"    Gdiff
"endfunction

"=====================
"   ULTISNIPS ( changed for coc-snippets )
"=====================
" autocmd BufNewFile,BufRead .vimspector.json UltiSnipsAddFiletypes vimspector.json
" this plugin enables the use of skeletons
" let g:did_UltiSnips_vim = 1
" let g:did_UltiSnips_vim_after = 1
let g:UltiSnipsExpandTrigger='<a-t>'
let g:UltiSnipsJumpForwardTrigger='<a-t>'
let g:UltiSnipsJumpBackwardTrigger='<a-s>'
let g:UltiSnipsListSnippets='<c-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]
" for normal mode
" nnoremap <a-t> i<c-r>=UltiSnips#JumpForwards()<cr>
" snoremap <a-t> <Esc>:call UltiSnips#JumpForwards()<cr>
"
noremap <silent><leader>I :silent call <SID>addSkel()<cr>
" doesn't work for autocmd because of ultisnip
" autocmd BufNewFile * :silent call feedkeys("\<space>I")
" autocmd BufNewFile * :silent call <SID>addSkel()
function! s:addSkel()
if !empty(b:projectionist)
    " Loop through projections with 'skeleton' key
    " and try each one until the snippet expands
    for [root, value] in projectionist#query('skeleton')
      if s:try_insert(value)
        call s:install_undo_workaround()
        return
      endif
    endfor
endif
if s:try_insert('skel')
    call s:install_undo_workaround()
endif

endfunction

function! s:install_undo_workaround() abort
  nnoremap <buffer> u :call <SID>undo_workaround()<CR>
endfunction

function! s:undo_workaround() abort
  normal! 2u
  nunmap <buffer> u
endfunction
" for ultisnips
" function! s:try_insert(skel)
"   execute 'normal! i_' . a:skel . "\<C-r>=UltiSnips#ExpandSnippet()\<CR>"
"   if g:ulti_expand_res == 0
"     silent! undo
"   endif
"   return g:ulti_expand_res
" endfunction

" for coc_snippets
let g:snippet_expanded = 0
function! s:try_insert(skel)
    silent execute 'normal! i_' . a:skel . "\<C-r>=Coc_expand()\<cr>"
    if g:snippet_expanded == 0
        silent! undo
    endif
    return g:snippet_expanded
endfunction
function! Coc_expand()
    if coc#expandable()
        let g:snippet_expanded = 1
        return coc#rpc#request('doKeymap', ['snippets-expand-jump',''])
    endif
    let g:snippet_expanded = 0
    return
endfunction

"==========
" VIMTEX
"==========
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

"tex conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none
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



" nerdcommenter
"nnoremap gc :call NERDComment(0,"toggle")<CR>
"vnoremap gc :call NERDComment(0,"toggle")<CR>

"======
" GOYO
"======

nnoremap <leader>gy :Goyo \| set wrap \| set linebreak<CR>
"nnoremap <leader>gd :Goyo! \| :set wrap! \| :set linebreak!<CR>


"=============
" HASKELL-VIM
"=============
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"==========
"INDENTLINE
"==========
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '┆'
let g:indentLine_enabled = 0

"==========
"VIM-INDENTLINE
"==========
" let g:indentguides_ignorelist = ['cpp']
" let g:indentguides_spacechar = '┆'
" let g:indentguides_tabchar = '|'

" enable vertical lines in javascript and typescript files
function VerticalLines()
    :IndentLinesToggle
    set shiftwidth=2
endfunction
nmap <leader>cL :call VerticalLines()<cr>
autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter *.{vim,jsx,json,ts,js} :call VerticalLines()
"these 2 only work with real tabs, not expanded tabs"
"set listchars=tab:┆.,trail:.,extends:>,precedes:<
"set list
"====================
" NEOFORMAT
"====================
" let g:neoformat_verbose = 1
"
" let g:neoformat_run_all_formatters = 1
" Enable alignment globally
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion globally
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace globally
let g:neoformat_basic_format_trim = 1

let g:neoformat_try_formatprg = 1
" let g:neoformat_only_msg_on_error = 1
"vvvvvvvvvvvvvvvvv
if !executable('black')
    :!pip3 install black
endif

if !executable('prettier') && $USER != 'root'
  if !executable('npm')
    :!yarn global add prettier
  else
    :!npm install -g prettier
  endif
endif
if !executable('clang-format')
    :!pip3 install clang-format
endif
" if !executable('uncrustify')
"     :!sudo eopkg install uncrustify
" endif
augroup fmt
    autocmd!
    autocmd BufWritePre *.{js,java,cpp,haskell,json,ts,rs,go} :Neoformat
augroup END

function FormatSelector() abort
  let l:special_cases = ['py']
  if index(l:special_cases, g:extension) >= 0 " si esta en el arreglo
    nmap <silent><leader>cp <Plug>(coc-format)
  else
    nmap <silent><Leader>cp :Neoformat<cr>
  endif
endfunction
call FormatSelector()
" js,java,c,cpp,haskell,json,ts,rs,go
"-----------
" PYTHON
"-----------
"'replace': 0 replace the file, instead of updating buffer (default: 0),
" let g:neoformat_python_black = {
"             \ 'exe': 'black',
"             \ 'args': ['-','--quiet','--line-length', '100'],
"             \ 'replace': 0,
"             \ 'stdin': 1,
"             \ }
" lets you use gq
" let g:neoformat_enabled_python = ['black', 'autopep8']

"-----------
" Javascript
"-----------
autocmd FileType javascript,,typescript let &l:formatprg='prettier --stdin-filepath ' .expand('%'). ' --print-width 90'
" uses google style
" autocmd FileType  let &l:formatprg='clang-format --assume-filename=' . expand('%:t'). ' -style=google'
autocmd FileType java,c,c++ let &l:formatprg='clang-format --assume-filename="' . expand('%:t'). '" -style=file'

let g:neoformat_javascript_prettier = {
            \ 'exe': 'prettier',
            \ 'args': ['--stdin-filepath','"%:p"','--print-width','90', '--no-semi'],
            \ 'replace': 0,
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_javascript = ['prettier']


" \ 'args': ['-assume-filename=' . expand('%:t'), '-style=google'],
let g:neoformat_java_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename="' . expand('%:t').'"', '-style=file'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_java = ['clangformat']

let g:neoformat_cpp_clangformat = {
            \ 'exe': 'clang-format',
            \ 'args': ['-assume-filename="' . expand('%:t').'"', '-style=file'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_cpp = ['clangformat']

"rust
" if !executable('rustfmt-nightly') && $USER != 'root'
"   rustup component add rls rust-analysis rust-src
" endif
" autocmd BufWritePre python Neoformat
"====================
" PRETTIER AND BLACK
"====================
" autocmd BufWritePre *.py :Black
" autocmd BufWritePre *.js,*.json,*.jsx,*. :Prettier
"======================
"black
"======================
"
"(defaults to 0)
"let g:black_fast = 0
""(defaults to 88)
"let g:black_linelength = 88
"" (defaults to 0)
"let g:black_skip_string_normalization = 0
""======================
""prettier
""======================
"" let g:prettier#config#print_width = 'auto'
"let g:prettier#config#print_width = 95
""(defaults to ~/.vim/black or ~/.local/share/nvim/black)
""let g:black_virtualenv ="~/.local/share/nvim/black"
"" nmap <Leader>p <Plug>(Prettier)
"nmap <silent><Leader>lp :call Formatting()<cr>
"" nmap <Leader>lp <Plug>(Prettier)

"function Formatting()
"    " the [:-2] is to take away the last new line character
"    let extension = expand('%:e')
"    if extension =~ '\v(j|t)s'
"        :execute "normal \<Plug>(Prettier)"
"        return
"    else
"        if extension =~ "py"
"            echo worked
"            " :call CocAction('format')
"            :Black
"            return
"        endif
"        :!clear && shellcheck %<CR>
"    endif
"endfunction

"=============
" EASYMOTION
"=============
let g:Easymotion_do_mapping = 0
map ¿ <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" devicons
" let g:webdevicons_enable = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsEnableFolderExtensionPatternMatching = 1

"=========
" TARGETS
"=========

let g:targets_aiAI = 'alAL'
" let g:targets_aiAI = 'aiAi'
let g:targets_mapped_aiAI = 'aiAI'
let g:targets_nl = 'nN'
" let g:targets_aiAI = ['<Space>a', '<Space>l', '<Space>A', '<Space>L']
" let g:targets_mapped_aiAI = ['<Space>a', '<Space>l', '<Space>A', '<Space>L']
"
"this script lets you apply macros to multiple lines
source ~/.config/nvim/modules/visual-at.vim

" =============
" MACROS
" =============
" whenever it finds an x, it runs this macro
let @z = 'fxa.testing0lbeggining'

" normal or norm is an ex command (a colon command, like :help)
nnoremap <leader>ri :g/x/normal @a<cr>

"============
" CLOSE TAGS
"============
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
"this is for adding a single > with no pair, bug with space
" let g:closetag_close_shortcut = '<leader>>'


" load folds that you did previously, breaks which-key
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
"
" ==========
" Emmet
" ==========
" enable just for desired filetypes
let g:user_emmet_install_global = 0
autocmd FileType html,css,js,jsx,ts EmmetInstall
let g:user_emmet_leader_key='<C-Y>'
" alt-gr s
let g:user_emmet_expandabbr_key = 'þ'
"  let g:user_emmet_expandword_key = '<C-y>;'
"  let g:user_emmet_update_tag = '<C-y>u'
"  "highlight tag groups"
"  let g:user_emmet_balancetaginward_key = '<C-y>d'
"  let g:user_emmet_balancetagoutward_key = '<C-y>D'
"  "this is the next edit point"
"  let g:user_emmet_next_key = '<C-y>n'
"  let g:user_emmet_prev_key = '<C-y>N'
"  let g:user_emmet_imagesize_key = '<C-y>i'
"  "this comments a whole tag group"
"  let g:user_emmet_togglecomment_key = '<C-y>/'
"  let g:user_emmet_splitjointag_key = '<C-y>j'
"  let g:user_emmet_removetag_key = '<C-y>k'
"  "with a link it creates a <a tag"
"  let g:user_emmet_anchorizeurl_key = '<C-y>a'
"  "good for citation (gives an automatic description of the website)"
"  let g:user_emmet_anchorizesummary_key = '<C-y>A'
"  let g:user_emmet_mergelines_key = '<C-y>m'
"  let g:user_emmet_codepretty_key = '<C-y>c'

" vim git gutter"
"
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
" disable all by default
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1

" JUPYTER-VIM
" let g:jupyter_mapkeys = 0 in your .vimrc to prevent the default keybindings from being made.
" let g:jupyter_mapkeys = 0
"
"
function SetupJupyter()
    " Run current file
    nnoremap <buffer> <silent> <leader><leader>R :JupyterRunFile<CR>
    nnoremap <buffer> <silent> <leader><leader>I :PythonImportThisFile<CR>

    " Change to directory of current file
    " nnoremap <buffer> <silent> <leader><leader>d :JupyterCd %:p:h<CR>

    " Send a selection of lines
    nnoremap <buffer> <silent> <leader><leader>x :JupyterSendCell<CR>
    nnoremap <buffer> <silent> <leader><leader>E :JupyterSendRange<CR>
    nmap     <buffer> <silent> <leader><leader>e <Plug>JupyterRunTextObj
    nmap <buffer> <silent> <leader><leader>c :JupyterConnect<cr>
endfunction
autocmd FileType python :call SetupJupyter()
" vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual

" nnoremap <buffer> <silent> <localleader>U :JupyterUpdateShell<CR>

" Debugging maps
" nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>

" polyglot
" removes annoying red highlight from every space you put
let g:python_highlight_space_errors = 0

" ================
" CAMELCASE MOTION
" ================
" let g:camelcasemotion_key = '<leader>'
map <silent> <leader>j <Plug>CamelCaseMotion_e
map <silent> <leader>gj <Plug>CamelCaseMotion_ge
map <silent> <leader>w <Plug>CamelCaseMotion_w
map <silent> <leader>b <Plug>CamelCaseMotion_b

omap <silent><leader>lw <Plug>CamelCaseMotion_iw
xmap <silent><leader>lw <Plug>CamelCaseMotion_iw
omap <silent><leader>lb <Plug>CamelCaseMotion_ib
xmap <silent><leader>lb <Plug>CamelCaseMotion_ib
omap <silent><leader>lj <Plug>CamelCaseMotion_ie
xmap <silent><leader>lj <Plug>CamelCaseMotion_ie

" replace with register
nmap gp  <Plug>ReplaceWithRegisterOperator
nmap gpp <Plug>ReplaceWithRegisterLine
xmap gp  <Plug>ReplaceWithRegisterVisual
"USAGE                         *ReplaceWithRegister-usage*
"
"                                *gr* *grr* *v_gr*
"[count]["x]gr{motion}  Replace {motion} text with the contents of register x.
"           Especially when using the unnamed register, this is
"           quicker than "_d{motion}P or "_c{motion}<C-R>"
"[count]["x]grr     Replace [count] lines with the contents of register x.
"           To replace from the cursor position to the end of the
"           line use ["x]gr$
"{Visual}["x]gr     Replace the selection with the contents of register x.

" indent text object
let g:textobj_indent_no_default_key_mappings = 1
" let g:indent_object_except_first_level = 0
vmap li <Plug>(textobj-indent-i)
omap li <Plug>(textobj-indent-i)
vmap ai <Plug>(textobj-indent-a)
omap ai <Plug>(textobj-indent-a)
vmap lI <Plug>(textobj-indent-same-i)
omap lI <Plug>(textobj-indent-same-i)
vmap aI <Plug>(textobj-indent-same-a)
omap aI <Plug>(textobj-indent-same-a)
"
" line text object
" only use for selecting, not for other stuff, has bugs

let g:textobj_line_no_default_key_mappings = 1
vmap <silent> ll <Plug>(textobj-line-i)
omap <silent> ll <Plug>(textobj-line-i)
vmap <silent> al <Plug>(textobj-line-a)
omap <silent> al <Plug>(textobj-line-a)

" entire text object
let g:textobj_entire_no_default_key_mappings = 1
" vmap <silent> le  <Plug>(textobj-entire-i)
" omap <silent> le  <Plug>(textobj-entire-i)
vmap <silent> le    <Plug>(textobj-entire-i)
omap <silent> le    <Plug>(textobj-entire-i)
vmap <silent> ae    <Plug>(textobj-entire-a)
omap <silent> ae    <Plug>(textobj-entire-a)

" python text objects
let g:textobj_python_no_default_key_mappings = 1
" silent! TextobjPythonDefaultKeyMappings!
" af: a function
" lf: inner function
" ac: a class
" lc: inner class
" [f previous function
" ]f next function
" [c previous class
" ]c next class
call textobj#user#map('python', {
            \   'class': {
            \     'select-a': '<buffer>ax',
            \     'select-i': '<buffer>lx',
            \     'move-n': '<buffer>]x',
            \     'move-p': '<buffer>[x',
            \   },
            \   'function': {
            \     'select-a': '<buffer>af',
            \     'select-i': '<buffer>lf',
            \     'move-n': '<buffer>]f',
            \     'move-p': '<buffer>[f',
            \   }
            \ })

" text object comments
" silent! TextobjCommentDefaultKeyMappings!
let g:textobj_comment_no_default_key_mappings = 1
vmap ac <Plug>(textobj-comment-a)
omap ac <Plug>(textobj-comment-a)
vmap lc <Plug>(textobj-comment-i)
omap lc <Plug>(textobj-comment-i)
" vmap lc <Plug>(textobj-comment-i)
" omap lc <Plug>(textobj-comment-i)
" a big comment
" whitespace after the comment, or if there isn't any,
"           whitespace before the comment.
"           Select linewise for full-line comments, characterwise
"           for inline and end-of-line comments.
vmap aC <Plug>(textobj-comment-big-a)
omap aC <Plug>(textobj-comment-big-a)


"=======================
" VISUAL MODE MOVE BLOCK
"=======================
let g:move_key_modifier = 'C'
" disable default bindings"
let g:move_map_keys = 0
vmap <down> <Plug>MoveBlockDown
vmap <up> <Plug>MoveBlockUp
vmap <left> <Plug>MoveBlockLeft
vmap <right> <Plug>MoveBlockRight

" smooth scroll
" change the second parameter to change the duration of the scroll
" noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
" noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
" noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 5, 4)<CR>
" noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 5, 4)<CR>

"Airline

let g:airline_powerline_fonts = 1
autocmd Filetype java,javascript,python let g:airline#extensions#tabline#enabled = 1
" autocmd Filetype python let g:airline#extensions#tabline#enabled = 1
"
"===================
" VIMSPECTOR
"===================
" let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
" nmap <leader>dw :VimspectorWatch
" autocmd Filetype java nmap <leader>dd :CocCommand java.debug.vimspector.start<cr>
"enable python debugging
" :VimspectorInstall vscode-python
"
fun GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun
let g:vimspector_install_gadgets = [ 'debugpy', 'CodeLLDB' ]
" setup guide for java https://urfoex.blogspot.com/2020/08/debugging-java-with-jdb-or-vim.html

nnoremap <leader><leader>dc :call GotoWindow(g:vimspector_session_windows.code)<cr>
nnoremap <leader><leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<cr>
nnoremap <leader><leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<cr>
nnoremap <leader><leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<cr>
nnoremap <leader><leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<cr>
nnoremap <leader><leader>do :call GotoWindow(g:vimspector_session_windows.stack_output)<cr>

nnoremap <leader><leader>dd :call vimspector#Launch()<CR>
nnoremap <silent> <leader><leader>di :silent exec '!createdbg ' . shellescape(g:extension) . ' ' . shellescape(expand("%:r"))<cr>
nmap <leader><leader>dD  <Plug>VimspectorStop
nnoremap <leader><leader>dr :call vimspector#Reset()<cr>
nmap <leader><leader>dR <Plug>VimspectorRestart
nmap <leader><leader>dl <Plug>VimspectorStepInto
nmap <leader><leader>dn <Plug>VimspectorStepOver
nmap <leader><leader>de <Plug>VimspectorStepOut
nmap <leader><leader>dp <Plug>VimspectorPause
nnoremap <leader><leader>d<space> :call vimspector#Continue()<cr>
nmap <leader><leader>dC <Plug>VimspectorRunToCursor
nmap <leader><leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader><leader>dB <Plug>VimspectorToggleConditionalBreakpoint
 " <Plug>VimspectorAddFunctionBreakpoint

" default config for a javascript file!
" Javascript
"{
"  "configurations": {
"    "run": {
"      "adapter": "vscode-node",
"      "configuration": {
"        "request": "launch",
"        "protocol": "auto",
"        "stopOnEntry": true,
"        "console": "integratedTerminal",
"        "program": "${workspaceRoot}/nice.js",
"        "cwd": "${workspaceRoot}"
"      }
"    },
"    "foobar": {}
"  }
"}

"===============
" VIM-COMMENTARY
"===============
autocmd FileType json setlocal commentstring=//%s
autocmd FileType sxhkdrc setlocal commentstring=#%s

" splitjoin
let g:splitjoin_split_mapping = 'gs'
let g:splitjoin_join_mapping = 'gS'

" nmap gs :SplitjoinSplit<cr>
" nmap gS :SplitjoinJoin<cr>

"=========
" VISTA
"=========
" defaultwhen running :Vista
" let g:vista_default_executive = 'coc'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista_sidebar_width = 30
" " " let g:vista_sidebar_position ="vertical topleft"
" " let g:vista_sidebar_position ="vertical botright"
" " let g:vista_ctags_cmd = {
" "   \ 'c': 'ctags -R',
" "   \ 'cpp': 'ctags -R',
" "   \}

" " let g:vista_finder_alternative_executives = ['ctags']

" " " nmap <leader>cv :Vista coc<cr>
" " nmap <leader>cv :Vista!!<cr>
" autocmd Filetype python,c,cpp,java,javascript,go,skell,vim nmap <leader>cV :Vista finder<cr>

"=========
" TAGBAR
"=========
" nmap <leader>cv :TagbarToggle<CR>
" let g:tagbar_position = 'rightbelow'
" let g:tagbar_iconchars = ['▶ ', '▼ ']
let g:tagbar_iconchars = ['▸ ', '▾ ']
        " let g:tagbar_iconchars = ['▷', '◢']
        " let g:tagbar_iconchars = ['+', '-']  (default on Windows)

" so it opens focused
let g:tagbar_autofocus = 1
let g:tagbar_width = 30

let g:tagbar_map_nexttag = '<c-n>'
let g:tagbar_map_prevtag = '<c-e>'

let g:tagbar_map_showproto = 'd'
let g:tagbar_map_openfold = 'zo'
let g:tagbar_map_closefold = 'zc'
let g:tagbar_map_openallfolds = 'zR'
let g:tagbar_map_closeallfolds = 'zM'
let g:tagbar_map_hidenonpublic = 'h'

" ranger.vim
let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
let g:NERDTreeHijackNetrw = 0
nmap <leader>sr :Ranger<cr>

" bclose
let g:bclose_no_plugin_maps=1

" eunuch (Basic filesystem settings)
" map <leader>sm :Move
" map <leader>sr :Rename
" map <leader>sc :Chmod
" map <leader>sm :Mkdir
" map <leader>sd :Delete
" map <leader>sw :Delete

"=====================
" VIS
"=====================
"
" map <leader>swp <Plug>SaveWinPosn
" map <leader>rwp <Plug>RestoreWinPosn

"===============
" SWITCH
"===============
" there are many options, lists, dicts, dicts of dicts, and custom mappings
" separate from the global ones
"https://github.com/AndrewRadev/switch.vim
"
let g:switch_mapping = "ß"
" autocmd FileType eruby let b:switch_custom_definitions =
"     \ [
"     \   {
"     \     ':\(\k\+\)\s\+=>': '\1:',
"     \     '\<\(\k\+\):':     ':\1 =>',
"     \   },
"     \ ]
" if the plugin encounters "foo" under the cursor, it will be changed to "bar".
" If it sees "bar", it will change it to "baz", and "baz" would be turned into "foo".
" let g:switch_custom_definitions =
"     \ [
"     \   ['foo', 'bar', 'baz']
"     \ ]


" for react
let b:switch_custom_definitions = [
            \   {
            \     '\(\k\+=\){\([[:keyword:].]\+\)}':      '\1{`${\2}`}',
            \     '\(\k\+=\){`${\([[:keyword:].]\+\)}`}': '\1{\2}',
            \     '==': '!=',
            \     '!=': '=='
            \   },
            \ ]
" it does this
"<Thing foo={data} />
"<Thing foo={`${data}`} />

" for latex
autocmd FileType tex,plaintex let b:switch_custom_definitions =
            \ [
            \    [ '\\tiny', '\\scriptsize', '\\footnotesize', '\\small', '\\normalsize', '\\large', '\\Large', '\\LARGE', '\\huge', '\\Huge' ],
            \    [ '\\displaystyle', '\\scriptstyle', '\\scriptscriptstyle', '\\textstyle' ],
            \    [ '\\part', '\\chapter', '\\section', '\\subsection', '\\subsubsection', '\\paragraph', '\\subparagraph' ],
            \    [ 'part:', 'chap:', 'sec:', 'subsec:', 'subsubsec:' ],
            \    [ 'article', 'report', 'book', 'letter', 'slides' ],
            \    [ 'a4paper', 'a5paper', 'b5paper', 'executivepaper', 'legalpaper', 'letterpaper', 'beamer', 'subfiles', 'standalone' ],
            \    [ 'onecolumn', 'twocolumn' ],
            \    [ 'oneside', 'twoside' ],
            \    [ 'draft', 'final' ],
            \    [ 'AnnArbor', 'Antibes', 'Bergen', 'Berkeley',
            \      'Berlin', 'Boadilla', 'CambridgeUS', 'Copenhagen', 'Darmstadt',
            \      'Dresden', 'Frankfurt', 'Goettingen', 'Hannover', 'Ilmenau',
            \      'JuanLesPins', 'Luebeck', 'Madrid', 'Malmoe', 'Marburg',
            \      'Montpellier', 'PaloAlto', 'Pittsburgh', 'Rochester', 'Singapore',
            \      'Szeged', 'Warsaw' ]
            \ ]
" map <--> noremap
" wrapscan <--> nowrapscan
" set inccommand=
"  "<Bar> <--> \|
autocmd FileType vim let b:switch_custom_definitions = [
            \ { '\<\([invoxtcl]\?\)noremap\>': '\1map'},
            \ { '\<\([invoxtcl]\?\)map\>': '\1noremap'},
            \ { '\<\(allowrevins\|ari\|autochdir\|acd\|arabic\|arab\|arabicshape\|arshape\|autoindent\|ai\|autoread\|ar\|autowrite\|aw\|autowriteall\|awa\|backup\|bk\|ballooneval\|beval\|binary\|bin\|bomb\|buflisted\|bl\|cindent\|cin\|confirm\|cf\|copyindent\|ci\|cscoperelative\|csre\|cscopetag\|cst\|cursorbind\|crb\|cursorcolumn\|cuc\|cursorline\|cul\|delcombine\|deco\|diff\|digraph\|dg\|endofline\|eol\|equalalways\|ea\|errorbells\|eb\|expandtab\|et\|fileignorecase\|fic\|fixendofline\|fixeol\|foldenable\|fen\|gdefault\|gd\|hidden\|hid\|hkmap\|hk\|hkmapp\|hkp\|hlsearch\|hls\|icon\|ignorecase\|ic\|imcmdline\|imc\|imdisable\|imd\|incsearch\|is\|infercase\|inf\|insertmode\|im\|joinspaces\|js\|langremap\|lrm\|lazyredraw\|lz\|linebreak\|lbr\|lisp\|list\|lpl\|loadplugins\|magic\|modeline\|ml\|modelineexpr\|mle\|modifiable\|ma\|modified\|mod\|more\|mousefocus\|mousef\|mousehide\|mh\|number\|nu\|opendevice\|odev\|paste\|preserveindent\|pi\|previewwindow\|pvw\|prompt\|readonly\|ro\|relativenumber\|rnu\|remap\|revins\|ri\|rightleft\|rl\|ruler\|ru\|scrollbind\|scb\|secure\|shellslash\|ssl\|shelltemp\|stmp\|shiftround\|sr\|showcmd\|sc\|showfulltag\|sft\|showmatch\|sm\|showmode\|smd\|smartcase\|scs\|smartindent\|si\|smarttab\|sta\|spell\|splitbelow\|sb\|splitright\|sr\|startofline\|sol\|swapfile\|swf\|tagbsearch\|tbs\|tagrelative\|tr\|tagstack\|tgst\|termbidi\|tbidi\|terse\|tildeop\|top\|timeout\|to\|ttimeout\|title\|ttyfast\|tf\|undofile\|udf\|visualbell\|vb\|warn\|wildignorecase\|wic\|wildmenu\|wmnu\|winfixheight\|wfh\|winfixwidth\|wfw\|wrap\|wrapscan\|ws\|write\|writeany\|wa\|writebackup\|wb\)\>': 'no\1'},
            \ { '\<no\(allowrevins\|ari\|autochdir\|acd\|arabic\|arab\|arabicshape\|arshape\|autoindent\|ai\|autoread\|ar\|autowrite\|aw\|autowriteall\|awa\|backup\|bk\|ballooneval\|beval\|binary\|bin\|bomb\|buflisted\|bl\|cindent\|cin\|confirm\|cf\|copyindent\|ci\|cscoperelative\|csre\|cscopetag\|cst\|cursorbind\|crb\|cursorcolumn\|cuc\|cursorline\|cul\|delcombine\|deco\|diff\|digraph\|dg\|endofline\|eol\|equalalways\|ea\|errorbells\|eb\|expandtab\|et\|fileignorecase\|fic\|fixendofline\|fixeol\|foldenable\|fen\|gdefault\|gd\|hidden\|hid\|hkmap\|hk\|hkmapp\|hkp\|hlsearch\|hls\|icon\|ignorecase\|ic\|imcmdline\|imc\|imdisable\|imd\|incsearch\|is\|infercase\|inf\|insertmode\|im\|joinspaces\|js\|langremap\|lrm\|lazyredraw\|lz\|linebreak\|lbr\|lisp\|list\|lpl\|loadplugins\|magic\|modeline\|ml\|modelineexpr\|mle\|modifiable\|ma\|modified\|mod\|more\|mousefocus\|mousef\|mousehide\|mh\|number\|nu\|opendevice\|odev\|paste\|preserveindent\|pi\|previewwindow\|pvw\|prompt\|readonly\|ro\|relativenumber\|rnu\|remap\|revins\|ri\|rightleft\|rl\|ruler\|ru\|scrollbind\|scb\|secure\|shellslash\|ssl\|shelltemp\|stmp\|shiftround\|sr\|showcmd\|sc\|showfulltag\|sft\|showmatch\|sm\|showmode\|smd\|smartcase\|scs\|smartindent\|si\|smarttab\|sta\|spell\|splitbelow\|sb\|splitright\|sr\|startofline\|sol\|swapfile\|swf\|tagbsearch\|tbs\|tagrelative\|tr\|tagstack\|tgst\|termbidi\|tbidi\|terse\|tildeop\|top\|timeout\|to\|ttimeout\|title\|ttyfast\|tf\|undofile\|udf\|visualbell\|vb\|warn\|wildignorecase\|wic\|wildmenu\|wmnu\|winfixheight\|wfh\|winfixwidth\|wfw\|wrap\|wrapscan\|ws\|write\|writeany\|wa\|writebackup\|wb\)\>': '\1'},
            \ { '\<\(set\s\+\(inccommand\|icm\)\s*=\s*\)$': '\1split' },
            \ { '\<\(set\s\+\(inccommand\|icm\)\s*=\s*\)split\>': '\1nosplit' },
            \ { '\<\(set\s\+\(inccommand\|icm\)\s*=\s*\)nosplit\>': '\1' },
            \ { '\c<Bar>': '\\|' },
            \ { '\\|': '<Bar>' }
            \]

" sneak (eye candy and vertical movement)
" let g:sneak#s_next = 1
" let g:sneak#label = 0
" map f <Plug>Sneak_f
" map F <Plug>Sneak_F
" map t <Plug>Sneak_t
" map T <Plug>Sneak_T
" highlight link Sneak None
" " Needed if a plugin sets the colorscheme dynamically:
" autocmd User SneakLeave highlight clear Sneak
"
" ==========
" CLEVER F
" ==========
"controls to search a character across multi lines or not. Please set it to 1 in your vimrc to
"search a character only in current line.
"
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 0
let g:clever_f_timeout_ms=3000
" let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs='¿'
" by default is <cr> but the remap doesnt work
" let g:clever_f_repeat_last_char_inputs=["\<CR>"]
" let g:clever_f_mark_char =0
let g:clever_f_mark_char =1
let g:clever_f_mark_char_color = "Search"
" it can search あ with this
let g:clever_f_use_migemo = 1

" ==========
" BRIGHTEST
" ==========
noremap <leader>cb :BrightestToggle<cr>
autocmd Filetype * :BrightestDisable
" let g:brightest#enable_on_CursorHold = 1
" let g:brightest#enable_clear_highlight_on_CursorMoved = 0
" highlights all instances of a the word under the cursor in the buffer
" \   "group" : "BrightestUnderline"
let g:brightest#highlight = {
            \   "group" : "WildMenu"
            \}

let g:brightest#highlight_in_cursorline = {
            \ "group": "Wildmenu"
            \}

let g:brightest#pattern = '\k\+'

let g:brightest#enable_filetypes = {
            \ "_": 1
            \}
" let g:brightest#enable_filetypes = {
"             \   ""   : 0,
"             \   "csv"   : 0,
"             \   "tex"   : 0,
"             \   "markdown" : 0,
"             \   "vim" : 0,
"             \   "cpp" : 0,
"             \   "python" : 0,
"             \   "javascript" : 0,
"             \   "java" : 0,
"             \   "typescript" : 0,
"             \}

"==========
" Ripgrep
"==========
nnoremap <leader>cf :Rg<space>
nnoremap <leader>cF :Rg <c-r>=expand('<cword>')<cr><cr>

"==========
"Anyfold
"==========
" autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
" let anyfold_fold_toplevel = 1
"
"==========
"Context
"==========
"
let g:context_filetype_blacklist = ["vim","tex"]
let g:context_enabled = 0

"==========
" AUTO-PAIRS
"==========
" System Shortcuts:
"     <CR> : Insert new indented line after return if cursor in blank brackets
"            or quotes.
"     <BS> : Delete brackets in pair
"     <M-p>: Toggle Autopairs (|g:AutoPairsShortcutToggle|)
"     <M-n>: Jump to next closed pair (|g:AutoPairsShortcutJump|)
"     <M-b>: BackInsert { (|g:AutoPairsShortcutBackInsert|) }
"     <M-e>: 'Fast' 'Wrap' (g:AutoPairsShortcutFastWrap)
"     { n n{ e n
"     << ()

let g:AutoPairsMultilineClose = 0
let g:AutoPairsMapBS=1
autocmd Filetype tex let b:AutoPairs = {"(": ")", "[": "]"}
let g:AutoPairsMapCh = '<c-h>'
let g:AutoPairsShortcutFastWrap = '<a-a>'
let g:AutoPairsShortcutToggle = '<a-b>'
let g:AutoPairsShortcutJump = '<a-w>'
" let g:AutoPairsShortcutBackInsert = '<Nop>'

"===========
"FZF
"===========
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
"===========
" COC-FZF
" ==========
" nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <leader>cD       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <leader>ccd       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <leader>ccc       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <leader>cce       :<C-u>CocFzfList extensions<CR>
" nnoremap <silent> <leader>cl       :<C-u>CocFzfList location<CR>
" nnoremap <silent> <leader>cv        :<C-u>CocFzfList outline<CR>
" nnoremap <silent> <a-n>            :<C-u>CocFzfList outline<CR>
nnoremap <silent> <leader>cs       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <leader>ccs       :<C-u>CocFzfList sources<CR>
nnoremap <silent> <leader>ccb       :<C-u>CocFzfListResume<CR>
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
"let g:coc_fzf_preview_toggle_key = '?'
"let g:coc_fzf_preview = 'up:50%'
"let g:coc_fzf_opts = ['--layout=reverse-list']
"to make the command same as other fzf commands
" let g:coc_fzf_preview = ''
" let g:coc_fzf_opts = []
"
" ================
" NEOTERM
" ================

" let g:neoterm_size="10"
let g:neoterm_size="20"
let g:neoterm_autoinsert = 1
" let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_automap_keys='¡tt'
let g:neoterm_keep_term_open = 0
" map <silent><Leader>T :Ttoggle<cr>

" open terminal
" map <Leader>st :new term://zsh \| resize 10<CR>a

"To map <Esc> to exit terminal-mode:
tmap <silent><a-t> <C-\><C-n>

" go up from terminal
tmap <silent><a-d> <a-t><c-w>e

" close terminal
" botright makes it appear at the bottom of all splits (or to the right of all, depending on
" the type of split (not determined by botright))
map <silent><a-q> :botright Ttoggle<CR>
tmap <silent><a-q> <a-t>:q<CR>

" noremap <a-d> <c-w>ja
nnoremap <silent><a-d> :call Switch_terminal()<CR>

function! Switch_terminal()

  if &buftype == "terminal"
    exec "normal! \<c-w>k"
    return
  endif

  let exists = bufwinnr("neoterm-*")
  if exists == -1
    :botright Ttoggle<CR>
    let exists = bufwinnr("neoterm-*")
  endif
  call utils#focus_window(exists)
endfunction


"=============
"GV
"=============
"
nnoremap <leader>glg :GV<cr>
nnoremap <leader>glG :GV!<cr>
nnoremap <leader>glog :GV?<cr>
" Commands

"     :GV to open commit browser
"         You can pass git log options to the command, e.g. :GV -S foobar -- plugins.
"     :GV! will only list commits that affected the current file
"     :GV? fills the location list with the revisions of the current file

" :GV or :GV? can be used in visual mode to track the changes in the selected lines.
" Mappings

"     o or <cr> on a commit to display the content of it
"     o or <cr> on commits to display the diff in the range
"     O opens a new tab instead
"     gb for :Gbrowse
"     ]] and [[ to move between commits
"     . to start command-line with :Git [CURSOR] SHA à la fugitive
"     q or gq to close
"
"============
"SYNTASTIC
"============
"disable for python
" let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
let g:syntastic_python_checkers = ['pylint', 'python', 'flake8']
let g:syntastic_python_python_exec = 'python3'

"===========
"ALE
"===========
"see :ALEInfo to see what is going on

" let g:ale_lint_on_text_changed = 1
" let g:ale_lint_on_enter = 1
let g:ale_lint_on_insert_leave = 0
let g:ale_enabled = 1
let g:ale_disable_lsp=1
let g:ale_fixers = {
            \ '*':'trim_whitespace',
            \ 'python': ['black']
            \}
let g:ale_fix_on_save = 0

" nmap <silent> , <Plug>(ale_previous_error)
" nmap <silent> ; <Plug>(ale_next_error)
" nmap g, <Plug>(ale_previous_wrap)
" nmap g; <Plug>(ale_next_wrap)
" nmap g. <Plug>(ale_fix)
" nmap cd <Plug>(ale_detail)
" nmap cl <Plug>(ale_toggle)
" let g:airline#extensions#ale#enabled = 1
" let g:ale_set_loclist = 1
"
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '∙∙'
let g:ale_set_highlights = 0

" let g:ale_sign_warning = ''
""
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_filetype_changed = 1
" let g:ale_linters_ignore= {'python': ['autopep8']}
let g:ale_close_preview_on_insert = 1
" map <leader>ll <Plug>(ale_toggle)
" make ale ONLY use the linters defined in g:ale_linters
let g:ale_linters_explicit = 1
let g:ale_linters =  {
            \   'elixir': ['credo', 'dialyxir', 'dogma'],
            \   'go': ['gofmt', 'golint', 'go vet'],
            \   'perl': ['all'],
            \   'python': ['flake8', 'pylint', 'mypy', 'pyright'],
            \   'rust': ['cargo', 'rls'],
            \   'text': [],
            \   'javascript': ['all'],
            \   'vue': ['eslint', 'vls'],
            \   'zsh': ['all'],
            \   'c': ['all'],
            \   'cpp': ['all'],
            \}

"======================
" RAINBOW PARENTHESIS
"======================
let g:rainbow_active = 0
noremap <leader>B :RainbowToggle<cr>

"==============
"VIM-TEST
"==============
nmap <silent> <leader>ctn :TestNearest<CR>
nmap <silent> <leader>ctf :TestFile<CR>
nmap <silent> <leader>cts :TestSuite<CR>
nmap <silent> <leader>ctl :TestLast<CR>
nmap <silent> <leader>ctg :TestVisit<CR>
" let test#strategy = "neoTerm"
let test#strategy = "dispatch"

"==============
"VIM-DISPATCH
"==============
" autocmd FileType java let b:dispatch = 'javac %'
" autocmd FileType cpp let b:dispatch = 'g++ %'
" autocmd FileType c let b:dispatch = 'gcc %'
" autocmd FileType typescript let b:dispatch = 'tsc %'
" cnoreabbrev Dispatch Dis
"==============
" HIGHLIGHTER
"==============
"it uses ctags to update highlights
":HighlighterUpdate
"
"==============
" VCS-JUMP
"==============

function! EnterNameToGrep()
    call inputsave()
    let l:name_to_grep = input("Enter Grep Input: ")
    call inputrestore()
    if len(l:name_to_grep) == 0
        return
    endif
    exe ":VcsJump grep " . l:name_to_grep
endfunction
nnoremap <silent><Leader>vd <Plug>(VcsJump)<cr>
nnoremap <silent><Leader>vm :VcsJump merge<cr>
nnoremap <Leader>vg :call EnterNameToGrep()<cr>

let g:VcsJumpMode="cwd" "can be buffer
"===========
" MAXIMIZER
"===========
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

"===========
" QUICKFIX-REFLECTOR
"===========
"
" If 1, automatically sets quickfix buffers 'modifiable'. If you prefer to do this manually, set the value to 0. Default: 1.
let g:qf_modifiable = 1


" If 1, changes within a single buffer will be joined using |:undojoin|, allowing them to be undone as a unit. Default: 0.
let g:qf_join_changes = 1

" If 1, writing the quickfix buffer will also write corresponding files. If 0,
" buffers of corresponding files will be changed but not written,
" allowing you to preview the changes before writing the individual buffers yourself. Default: 1

let g:qf_write_changes = 1

"========================
" VIM BE GOOD AND VIM APM
"========================
"By default vim be good returns random offset for game difficult above noob,
"if you with to set fixed offset set vim_be_good_delete_me_offset to desired value.
" let g:vim_be_good_delete_me_offset = 35
"
nnoremap <leader>.v :VimBeGood<cr>
nnoremap <leader>.w :VimApm<cr>
nnoremap <leader>.s :VimApmShutdown<cr>


"========================
" VIM-BUJO
"========================
let g:bujo#window_width = 40
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
nmap <silent><leader>,g :call BujoGlobal()<CR>
nmap <silent><leader>,; :call BujoGlobal()<CR>
nmap <silent><leader>,, :call BujoProject()<CR>
" nmap <M-,> <Plug>BujoAddnormal
" imap <M-,> <Plug>BujoAddinsert
"
" returns 0 if not found
function SearchCheck()
" search string in current cursor pos and backwards for - character
  return (search('-', 'nc', line('.')) || search('-', 'nbc', line('.')))
endfunction

nmap <expr><M-,> SearchCheck() ? 'i[] ' : 'i- [] '
imap <expr><M-,> SearchCheck() ? '[] ' : '- [] '
"TODO add check insert like the 2 above
nmap <M-.> <Plug>BujoChecknormal
imap <M-.> <Plug>BujoCheckinsert

noremap <leader>,p :call BujoPersonal()<CR>

function BujoPersonal()
if (expand('%') == 'todo.md')
  if &mod == 1
    :wq!
    let date = strftime('%F')
    silent call git#push(expand('$WIKI'), date)
    " silent exec 'Start! -wait=never git -C $HOME/.cache/bujo add . && git -C $HOME/.cache/bujo commit -m "$(date)" && git -C $HOME/.cache/bujo push origin master'
  else
    :q
  endif
else
  set nosplitright
  exec ':vs $WIKI/todo.md'
  set splitright
endif
endfunction

function BujoGlobal()
if (expand('%') == 'todo.md')
  if &mod == 1
    :wq!
    let date = strftime('%F')
    silent call git#push(expand('$HOME/.cache/bujo'), date)
    " silent exec 'Start! -wait=never git -C $HOME/.cache/bujo add . && git -C $HOME/.cache/bujo commit -m "$(date)" && git -C $HOME/.cache/bujo push origin master'
  else
    :q
  endif
else
  set nosplitright
  exec ':Todo g'
  set splitright
endif
endfunction

function BujoProject()
if (expand('%') == 'todo.md')
  if &mod == 1
    :wq!
    let date = strftime('%F')
    silent call git#push(expand('$HOME/.cache/bujo'), date)
    " silent exec 'Start! -wait=never git -C $HOME/.cache/bujo add . && git -C $HOME/.cache/bujo commit -m "$(date)" && git -C $HOME/.cache/bujo push origin master'
  else
    :q
  endif
else
  set nosplitright
  exec ':Todo'
  set splitright
endif
endfunction

"========================
" VIM-MAN
"========================
" map <leader>k <Plug>(Man) - open man page for word under cursor in a horizontal split
map <leader>N <Plug>(Vman)

"
"t========================
" VIM-PROJECTIONIST
"========================
"
" heuristics, for general files
"
" java needs to be run with Dispatch!
"the heuristic is different from .projections.json
"the "*" is the project finder, .projections.json doesn't need it
"
"type is used so you can do stuff like :Esource
let g:projectionist_heuristics = {
            \ "*": {
                \ "*.js": {
                \   "alternate": [
                \   "{dirname}/{basename}.test.js",
                \   "{dirname}/__tests__/{basename}-test.js",
                \   ],
                \   "type": "source",
                \   "dispatch": "node {}.js",
                \   "console": "node {}.js"
                \ },
                \
                \ "*.ts": {
                \   "alternate": [
                \   "{dirname}/{basename}.test.js",
                \   "{dirname}/__tests__/{basename}-test.js",
                \   ],
                \   "dispatch": "tsc % && node %:r.js"
                \ },
                \
                \ "*.c": {
                \   "dispatch": "gcc -g -o {basename} {file} && ./{basename}",
                \   "alternate": "{}.h",
                \ },
                \
                \ "*.cpp": {
                \   "dispatch": "g++ -g -o {basename} {file} && ./{basename}",
                \   "alternate": "{}.h",
                \ },
                \ "*.tex": {
                \   "dispatch": "latexmk -pdf {file}",
                \   "alternate": "mybib.bib",
                \ },
                \
                \ "*.java": {
                \   "dispatch": "javac *.java && java {basename}",
                \   "skeleton": "class",
                \ },
                \
                \ "*.py": {
                \   "dispatch": "python3 %",
                \ },
                \
                \ "*.rs": {
                \   "dispatch": "cargo run",
                \ },
                \
                \ "*.go": {
                \   "dispatch": "go run {file}",
                \ },
                \ "*": {
                \   "dispatch": "chmod +x %; ./%",
                \ },
            \},
            \ "src/*": {
                \ "src/containers/*.js": {
                \    "type": "container",
                \    "template": [
                \      "import React, {open} Component {close} from 'react';\n",
                \      "export default class {capitalize} extends Component {",
                \      "  render () {",
                \      "    return (",
                \      "    );",
                \      "  };",
                \      "}",
                \      "",
                \      "export default connect(",
                \      "  state => ({open}state: state{close}),",
                \      "  dispatch => ({open}actions: bindActionCreators(actions, dispatch){close})",
                \      ")({capitalize});"
                \    ]
                \  },
                \  "src/components/*.js": {
                \    "type": "component",
                \    "template": [
                \      "import React, {open} Component {close} from 'react';\n",
                \      "export default class \{} extends Component {",
                \      "  render () {",
                \      "    return (",
                \      "    );",
                \      "  };",
                \      "}"
                \    ]
                \  },
                \  "src/reducers/*.js": {
                \    "type": "reducer"
                \  },
                \  "package.json": {
                \    "type": "package"
                \  },
                \}
        \ }

" this is a sample of a .projections.json
"
"{
"  "src/main/java/*.java": {
"    "alternate": "src/test/java/{}.java",
"    "type": "source"
"  },
"  "src/test/java/*.java": {
"    "alternate": "src/main/java/{}.java",
"    "type": "test"
"  },
"  "*.java": {
"    "dispatch": "javac -classpath \".:sqlite-jdbc-3.32.3.2.jar\" *.java && java -classpath \".:sqlite-jdbc-3.32.3.2.jar\" {}"
"  },
"  "*": { "make": "mvn" }
"}

" autocmd User ProjectionistDetect
"             \ if SomeCondition(g:projectionist_file) |
"             \   call projectionist#append(root, projections) |
"             \ endif
"
" dot             / to .
" underscore      / to _
" backslash       / to \
" colons          / to ::
" hyphenate       _ to -
" blank           _ and - to space
" uppercase       uppercase
" camelcase       foo_bar/baz_quux to fooBar/bazQuux
" snakecase       FooBar/bazQuux to foo_bar/baz_quux
" capitalize      capitalize first letter and each letter after a slash
" dirname         remove last slash separated component
" basename        remove all but last slash separated component
" singular        singularize
" plural          pluralize
" file            absolute path to file
" project         absolute path to project
" open            literal {
" close           literal }
" nothing         empty string
" vim             no-op (include to specify other implementations should ignore)

" autocmd User ProjectionistActivate call s:activate()

"     function! s:activate() abort
"       for [root, value] in projectionist#query('wrap')
"         let &l:textwidth = value
"         break
"       endfor
"     endfunction
"
"{
"  navigation
"  "plugin/*.vim": {"type": "plugin"},
"  "autoload/*.vim": {"type": "autoload"},
"  "doc/*.txt": {"type": "doc"},
"  "README.markdown": {"type": "doc"}
"  alternate files
"  "src/main/java/*.java": {"alternate": "src/test/java/{}.java"},
"  "src/test/java/*.java": {"alternate": "src/main/java/{}.java"}
"  run files
"   "*": {"make": "rake"},
"   "spec/*_spec.rb": {"dispatch": "rspec {file}"}
"}
""

"============
" ZEAVIM
"============
nmap gz <Plug>ZVOperator
nmap gZ <Plug>ZVKeyDocset
nmap gzz <Plug>Zeavim
vmap gzz <Plug>ZVVisSelection
"g:zv_keep_focus - Keep or not the focus on vim after executing zeal
let g:zv_keep_focus = 0
let g:zv_file_types = {
            \   'help'                : 'vim',
            \   'javascript'          : 'javascript,nodejs',
            \   'python'              : 'django',
            \   '\v^.+\.js' : 'javascript,nodejs',
            \ }

"==========
"OBSESSION
"==========
noremap <leader>co :source %:h/Session.vim<bar> :Obsession<CR>
noremap <leader>cO :Obsession<CR>
set statusline=%{ObsessionStatus()}
