" UndoTreeToggle
map <leader>u :UndotreeToggle<CR>

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
    g:nerdFirsttime = 1
endfunction
" map <leader>se :NERDTreeToggle<CR>:call <SID>UpdateNerd()<CR>
noremap <leader>se :NERDTreeToggle<CR>:call <SID>UpdateNerd()<CR>

" function s:EnterFileName()
"     call inputsave()
"     let g:FileName_ = input("File name: ")
"     call inputrestore()
" endfunction
" nnoremap <leader>sn  :call <SID>EnterFileName()<cr> <bar>:e <C-r>=FileName_ <cr> <bar> startinsert<cr> <c-o>:w <cr>
function EnterFileName()
    call inputsave()
    let l:filename = input("Enter filename: ")
    call inputrestore()
    while len(l:filename) == 0
        let l:filename = input("Invalid. Enter filename:")
    endwhile
    exe ":e " . l:filename
    w
    startinsert
endfunction

nnoremap <leader>sn  :call EnterFileName()<cr>

" nnoremap <silent><leader>sn  :call <SID>FileName()<cr> <bar> :call <SID>CreateFileNamed()<cr>


map <leader>,b :Bookmark<CR>

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
let NERDTreeShowHidden=0

let NERDTreeMenuUp   = 'e'
let NERDTreeMenuDown = 'n'

let NERDTreeMapOpenExpl = 'k'
let NERDTreeMapOpenSplit = "s"
let NERDTreeMapPreview = "o"
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

" Undo tree
nnoremap <F5> :UndotreeToggle<cr>

" fzf
" \ 'ctrl-t': 'tab split',
let g:fzf_action = {
            \ 'alt-s': 'split',
            \ 'alt-v': 'vsplit' }
" for rg
let g:rg_derive_root='true'
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
nnoremap <a-p> :PFiles<cr>
nnoremap <leader>sb :Buffers<cr>
nnoremap <leader>,p :GFiles<cr>
let g:vista_default_executive = 'ctags'
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


" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep(
"   \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
"   \   fzf#vim#with_preview({'dir': s:find_current_root()}), <bang>0)

" for ripgrep
command! -bang -nargs=* Rgfzf
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(expand('<cword>')), 1,
            \   fzf#vim#with_preview({'dir': s:find_current_root()}), <bang>0)
map <leader>sf :Rgfzf<cr>

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

" GoTo code navigation.
"nmap <leader>gd <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gD <Plug>(coc-type-declaration)
nmap <silent> <leader>cf <Plug>(coc-format)
nmap gr <Plug>(coc-references)
nmap <leader>gr <Plug>(coc-references-used)
nmap gR <Plug>(coc-implementation)
" nmap <leader>gi <Plug>(coc-implementation)
nmap g, <Plug>(coc-diagnostic-prev)
nmap g; <Plug>(coc-diagnostic-next)
" g{ and g} are usable
nmap <silent> , <Plug>(coc-diagnostic-prev-error)
nmap <silent> ; <Plug>(coc-diagnostic-next-error)
nnoremap <silent> <leader>+ :call CocAction('doHover')<cr>
nmap <F2> <Plug>(coc-rename)
nmap <leader>cp :CocSearch <C-R>=expand('<cword>')<cr><cr>

":CocRebuild                        *:CocRebuild*
" use when you upgrade nodejs

nmap <leader>cA <Plug>(coc-codeaction)
nmap <leader>ca <Plug>(coc-codeaction-line)
vmap <leader>ca <Plug>(coc-codeaction-selected)
" Use `[g` and `]g` to navigate diagnostics (errors)
nmap <silent> c[ <Plug>(coc-diagnostic-prev)
nmap <silent> c] <Plug>(coc-diagnostic-next)
nmap <silent> c, <Plug>(coc-fix-current)
nmap <silent> cr <Plug>(coc-refactor)
cnoreabbrev CS CocSearch

" nnoremap <silent> <leader>cs :call CocAction('documentSymbols')<cr>
" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>ccd  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>cd  :<C-u>CocDiagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>cce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>ccc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>ccs  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <leader>ce  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <leader>ccl  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <leader>ccr  :<C-u>CocRestart<cr>
nnoremap <silent><nowait> <leader>cl  :<C-u>CocOpenLog<CR>

" scroll documentation
" nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
" nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
" inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
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
        silent! call timer_start(600, 'ShowDocIfNoDiagnostic')
    endif
endfunction

function! ShowDocIfNoDiagnostic(timer_id)
    if (coc#util#has_float() == 0)
        " silent! call CocActionAsync('doHover')
        " non async so it doesnt try to create another one once theres already a rendered one
        silent! call CocAction('doHover')
    endif
endfunction

function Activate_hover()
    autocmd CursorHoldI * silent! call <SID>show_hover_doc()
    autocmd CursorHold  * silent! call<SID>show_hover_doc()
endfunction

autocmd FileType python,cpp,javascript,c,java :call Activate_hover()

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
imap <silent><expr> <a-n> pumvisible() ? "\<C-n>" : "\<c-n>"
imap <silent><expr> <a-e> pumvisible() ? "\<C-p>" : "\<c-e>"

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




"Coc-snippets
" let g:coc_snippet_next = '<TAB>'
" let g:coc_snippet_prev = '<S-TAB>'
"to scroll with tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"imap <C-l> <Plug>(coc-snippets-expand)
"


" \ 'coc-html',
" \ 'coc-json',
            " \ 'coc-pairs',
            " \ 'coc-snippets',
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-json',
            \ 'coc-tag',
            \ 'coc-tsserver',
            \ 'coc-css',
            \ 'coc-vimtex',
            \ 'coc-python',
            \ 'coc-sh',
            \ 'coc-tslint-plugin',
            \ 'coc-prettier',
            \ 'coc-clangd',
            \ ]
" coc-clangd is necessary for c and c++


au FileType css,scss let b:prettier_exec_cmd = "prettier-stylelint"

" =====================
" Sweet Sweet FuGITive
" =====================
nmap <leader>gi :diffget //3<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gs :G<CR>

nnoremap <leader>gst :Gstatus<CR>
" use ctrl + d to delete branches
" alt + enter to track from origin, locally : origin/ foo becomes foo
" - Press <alt-enter> to track a remote branch locally (`origin/foo` becomes `foo`)
" - Press <ctrl-b> to create a branch or tag with the current query as name
" - Press <ctrl-d> to delete a branch or tag
" - Press <ctrl-e> to merge a branch
" - Press <ctrl-r> to rebase a branch
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>ggc :Gcommit<CR>
nnoremap <leader>gd :Gdiff<CR>
" nnoremap <leader>glg :Glog --reverse<CR>
nnoremap Q :Glog --reverse<CR>
nnoremap <leader>ggp :Git push<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gB :Gbrowse<CR>
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
"   ULTISNIPS
"=====================
"
" Set <space> as primary trigger
" inoremap <silent><cr> <C-R>=ExpandUsingSpace()<CR>
" let g:ulti_expand_res = 0
" function! ExpandUsingSpace()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res
"         return ''
"     else
"         return ' '
" endfunction

let g:UltiSnipsExpandTrigger='<a-t>'
" let g:UltiSnipsExpandTrigger=''
let g:UltiSnipsListSnippets='<c-tab>'
" let g:UltiSnipsJumpForwardTrigger = '<tab>'
" let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<a-t>'
let g:UltiSnipsJumpBackwardTrigger = '<a-s>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]



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
autocmd FileType python call PythonMappings()

function PythonMappings()
    map <leader><leader>p :CocCommand python.setInterpreter<cr>
    map <leader><leader>r :CocCommand python.execInTerminal<cr>
    map <leader><leader>l :CocCommand python.setLinter<cr>
    map <leader><leader>g :CocCommand python.viewOutput<cr>
endfunction
" call coc#config('python', {
"  \   'jediEnabled': v:false,
"  \   'pythonPath': split(execute('!which python3'), '\n')[-1]
"  \ })
"
	call coc#config('python', {
		\ 'formatting.blackPath': $HOME."/.local/bin/black",
		\})
		" \ 'linting.pylintPath': $HOME."/.local/bin/pylint"

" nerdcommenter
"nnoremap gc :call NERDComment(0,"toggle")<CR>
"vnoremap gc :call NERDComment(0,"toggle")<CR>

" Goyo

nnoremap <leader>gy :Goyo \| set wrap \| set linebreak<CR>
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
autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter *.js,*.ts,*.json,*.jsx :call VerticalLines()
"these 2 only work with real tabs, not expanded tabs"
"set listchars=tab:┆.,trail:.,extends:>,precedes:<
"set list
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

"====================
" NEOFORMAT
"====================
" Enable alignment globally
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion globally
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace globally
let g:neoformat_basic_format_trim = 1

let g:neoformat_try_formatprg = 1
" let g:neoformat_only_msg_on_error = 1
"vvvvvvvvvvvvvvvvv
" let g:neoformat_verbose = 1
if !executable('black')
    :!pip3 install black
endif

if !executable('prettier')
    :!npm install -g prettier
endif
if !executable('clang-format')
    :!pip3 install clang-format
endif
" if !executable('uncrustify')
"     :!sudo eopkg install uncrustify
" endif
augroup fmt
    autocmd!
    autocmd BufWritePre *.py,*.js,*.java,*.c,*.cpp,*.haskell :Neoformat
augroup END
nmap <silent><Leader>sp :Neoformat<cr>
"-----------
" PYTHON
"-----------
"'replace': 0 replace the file, instead of updating buffer (default: 0),
let g:neoformat_python_black = {
            \ 'exe': 'black',
            \ 'args': ['-','--quiet','--line-length', '90'],
            \ 'replace': 0,
            \ 'stdin': 1,
            \ }
" lets you use gq
autocmd FileType python setlocal formatprg=black\ -\ \
            \--quiet\ \
            \--line-length\ 90

let g:neoformat_enabled_python = ['black']
"-----------
" Javascript
"-----------
autocmd FileType javascript,json,typescript let &l:formatprg='prettier --stdin-filepath ' .expand('%'). ' --print-width 90'
" uses google style
" autocmd FileType java,c,c++ let &l:formatprg='clang-format --assume-filename=' . expand('%:t'). ' -style=google'
autocmd FileType java,c,c++ let &l:formatprg='clang-format --assume-filename=' . expand('%:t'). ' -style=file'

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
            \ 'args': ['-assume-filename=' . expand('%:t'), '-style=file'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_java = ['clangformat']

" autocmd BufWritePre python Neoformat
"====================
" PRETTIER AND BLACK
"====================
" autocmd BufWritePre *.py :Black
" autocmd BufWritePre *.js,*.json,*.jsx,*.ts :Prettier
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
map // <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" devicons
" let g:webdevicons_enable = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsEnableFolderExtensionPatternMatching = 1

" targets plugin
"

let g:targets_aiAI = 'alAL'
" let g:targets_aiAI = 'aiAi'
let g:targets_mapped_aiAI = 'aiAI'
let g:targets_nl = 'nN'
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
let g:user_emmet_expandabbr_key = 'ß'
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
    nnoremap <buffer> <silent> <leader><leader>d :JupyterCd %:p:h<CR>

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


" visual mode move
let g:move_key_modifier = 'C'
" disable default bindings"
let g:move_map_keys = 0
vmap <C-n> <Plug>MoveBlockDown
vmap <C-e> <Plug>MoveBlockUp
vmap <C-h> <Plug>MoveBlockLeft
vmap <C-i> <Plug>MoveBlockRight

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

" vimspector
" let g:vimspector_enable_mappings = 'HUMAN'
" packadd! vimspector
" nmap <leader>dd :call vimspector#Launch()<CR>
" nmap <leader>dw :VimspectorWatch
" autocmd Filetype java nmap <leader>dd :CocCommand java.debug.vimspector.start<cr>
"enable python debugging
" :VimspectorInstall vscode-python
" <Plug>VimspectorContinue
" <Plug>VimspectorStop
" <Plug>VimspectorRestart
" <Plug>VimspectorPause
" <Plug>VimspectorToggleBreakpoint
" <Plug>VimspectorToggleConditionalBreakpoint
" <Plug>VimspectorAddFunctionBreakpoint
" <Plug>VimspectorStepOver
" <Plug>VimspectorStepInto
" <Plug>VimspectorStepOut
"{
"  "configurations": {
"    "univisal: Launch": {
"      "adapter": "debugpy",
"      "configuration": {
"        "name": "Launch",
"        "type": "python",
"        "request": "launch",
"        "cwd": "${workspaceRoot}",
"        "stopOnEntry": true,
"        "console": "externalTerminal",
"        "debugOptions": [],
"        "program": "${file}"
"      }
"    }
"  }
"}

" vim-commentary
autocmd FileType json setlocal commentstring=//%s
autocmd FileType sxhkdrc setlocal commentstring=#%s

" splitjoin
let g:splitjoin_split_mapping = 'gs'
let g:splitjoin_join_mapping = 'gS'

" nmap gs :SplitjoinSplit<cr>
" nmap gS :SplitjoinJoin<cr>
"
" vista
"
" defaultwhen running :Vista
let g:vista_default_executive = 'coc'
let g:vista_fzf_preview = ['right:50%']
let g:vista_sidebar_width = 30
" " let g:vista_sidebar_position ="vertical topleft"
" let g:vista_sidebar_position ="vertical botright"
" let g:vista_ctags_cmd = {
"   \ 'c': 'ctags -R',
"   \ 'cpp': 'ctags -R',
"   \}

" let g:vista_finder_alternative_executives = ['ctags']

" " nmap <leader>cv :Vista coc<cr>
" nmap <leader>cv :Vista!!<cr>
autocmd Filetype python,c,cpp,java,javascript,go,haskell nmap <leader>cf :Vista finder<cr>

" Tagbar
nmap <leader>cv :TagbarToggle<CR>
" let g:tagbar_position = 'rightbelow'

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
nmap <leader>f :Ranger<cr>

" bclose
let g:bclose_no_plugin_maps=1

" eunuch (Basic filesystem settings)
" map <leader>sm :Move
" map <leader>sr :Rename
" map <leader>sc :Chmod
" map <leader>sm :Mkdir
" map <leader>sd :Delete
" map <leader>sw :Delete

" vis settings
" map <leader>swp <Plug>SaveWinPosn
" map <leader>rwp <Plug>RestoreWinPosn

" switch.vim
" there are many options, lists, dicts, dicts of dicts, and custom mappings
" separate from the global ones
"https://github.com/AndrewRadev/switch.vim
"
let g:switch_mapping = "¿"
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
"-------------------------------------------------


let b:switch_custom_definitions = [
            \   {
            \     '\(\k\+=\){\([[:keyword:].]\+\)}':      '\1{`${\2}`}',
            \     '\(\k\+=\){`${\([[:keyword:].]\+\)}`}': '\1{\2}',
            \   }
            \ ]
" it does this
"<Thing foo={data} />
"<Thing foo={`${data}`} />

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
" clever f
"controls to search a character across multi lines or not. Please set it to 1 in your vimrc to
"search a character only in current line.
"
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 0
let g:clever_f_timeout_ms=3000
" let g:clever_f_show_prompt=1
let g:clever_f_chars_match_any_signs='¿'
" by default is <cr> but the remap doesnt work
let g:clever_f_repeat_last_char_inputs=["\<CR>"]
let g:clever_f_mark_char =0
let g:clever_f_mark_char_color = "Search"
" it can search あ with this
let g:clever_f_use_migemo = 1

" brightest
" highlights all instances of a the word under the cursor in the buffer
let g:brightest#highlight = {
            \   "group" : "BrightestUnderline"
            \}
let g:brightest#pattern = '\k\+'
let g:brightest#enable_filetypes = {
            \   ""   : 0,
            \   "vim" : 1,
            \   "cpp" : 1,
            \   "python" : 1,
            \   "javascript" : 1,
            \   "java" : 1,
            \   "typescript" : 1,
            \}

"==========
" Ripgrep
"==========
nnoremap <leader>a :Rg<space>

"==========
"Anyfold
"==========
autocmd Filetype * AnyFoldActivate
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
" AUTOPAIRS
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
"
let g:AutoPairsMapCh = '<c-h>'
let g:AutoPairsShortcutFastWrap = '<a-a>'
let g:AutoPairsShortcutToggle = '<a-b>'
let g:AutoPairsShortcutJump = '<a-w>'
" let g:AutoPairsShortcutBackInsert = '<Nop>'

"===========
"fzf
"===========
let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6 } }
"===========
" coc-fzf
" ==========
" nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
" nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
" nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
" nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
" nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
" nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
" nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
" nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
" nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>
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
"
let g:neoterm_size="10"
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_automap_keys=''
let g:neoterm_keep_term_open = 0
map <silent><Leader>st :Ttoggle<cr>

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
