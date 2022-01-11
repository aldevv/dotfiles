if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/themes.vim")) && empty($NOCOC)
    source $XDG_CONFIG_HOME/nvim/modules/themes.vim
endif
"=====
"COC
"=====
if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/fzf.vim")) && empty($NOCOC)
    source $XDG_CONFIG_HOME/nvim/modules/fzf.vim
endif
"
if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/coc.vim")) && empty($NOCOC)
    source $XDG_CONFIG_HOME/nvim/modules/coc.vim
endif

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
if has('nvim-0.5.0')
    set diffopt=internal,vertical,closeoff,filler
endif

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
nnoremap <leader>gds :Gdiffsplit!<CR>
nnoremap <leader>gdd :Gvdiffsplit!<CR>
nnoremap <leader>gdD :Git difftool<CR>
" this works like VS jumper, test to see if i deprecate the other one
nnoremap <leader>gM :Git mergetool<CR>
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


"==========
"INDENTLINE
"==========
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '┆'
" let g:indentLine_enabled = 0
" nmap <leader>sv :IndentLinesToggle<cr>
" autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter *.{vim,jsx,json,ts,js} :IndentLines
"------------------------------------------------------------------------------------
if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/format.vim")) && empty($NOCOC)
    source $XDG_CONFIG_HOME/nvim/modules/coc.vim
endif

"=============
"EDITORCONFIG
"=============
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


" devicons
" let g:webdevicons_enable = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsEnableFolderExtensionPatternMatching = 1

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
" cant be migrated
" let g:closetag_regions = {
"             \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"             \ 'javascript.jsx': 'jsxRegion',
"             \ }


" =============================
" VIM GIT GUTTER"
" =============================
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
"
" nmap gp  <Plug>ReplaceWithRegisterOperator
" nmap gpp <Plug>ReplaceWithRegisterLine
" xmap gp  <Plug>ReplaceWithRegisterVisual
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

" ===================
" INDENT-TEXT-OBJECT current
" ===================
" if no docs, do :helptags doc to load it into memory
"<count>ai 	An Indentation level and line above.
" <count>ii 	Inner Indentation level (no line above).
" <count>aI 	An Indentation level and lines above/below.
" <count>iI 	Inner Indentation level (no lines above/below).
"Note: the iI mapping is mostly included simply for completeness, it is effectively a synonym for ii. ===================


" ===================
" INDENT-TEXT-OBJECT 2, deprecated
" ===================
"
" line text object
" only use for selecting, not for other stuff, has bugs
" let g:textobj_line_no_default_key_mappings = 1
" vmap <silent> ll <Plug>(textobj-line-i)
" omap <silent> ll <Plug>(textobj-line-i)
" vmap <silent> al <Plug>(textobj-line-a)
" omap <silent> al <Plug>(textobj-line-a)

" " entire text object
" let g:textobj_entire_no_default_key_mappings = 1
" vmap <silent> le    <Plug>(textobj-entire-i)
" omap <silent> le    <Plug>(textobj-entire-i)
" vmap <silent> ae    <Plug>(textobj-entire-a)
" omap <silent> ae    <Plug>(textobj-entire-a)

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

if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/vimspector.vim")) && empty($NOCOC)
    source $XDG_CONFIG_HOME/nvim/modules/vimspector.vim
endif
"===============
" VIM-COMMENTARY
"===============
autocmd FileType json setlocal commentstring=//%s
autocmd FileType sxhkdrc setlocal commentstring=#%s

" ==========
" SPLITJOIN
" ==========
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
" BCLOSE
"=========
"The :Bclose command deletes a buffer without changing the window layout, unlike :bd.
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

" ==========
" BRIGHTEST
" ==========
noremap <leader>B :BrightestToggle<cr>
"TODO check this one" autocmd Filetype * :BrightestDisable

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
nnoremap <leader>rg :Rg<space>
nnoremap <leader>rG :Rg <c-r>=expand('<cword>')<cr><cr>

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
" let g:AutoPairsFlyMode = 0
" let g:AutoPairsMultilineClose = 0
" let g:AutoPairsMapBS=1
" let g:AutoPairsMapCh = 0 "use pars mapBS better"

" autocmd Filetype tex let b:AutoPairs = {"(": ")", "[": "]"}
"  let g:AutoPairsSingleQuoteExpandFor = "fbr" " they are not gonna mess much in english for f''
" let g:AutoPairsDoubleQuoteExpandFor = 'fbr'
" let g:AutoPairsSingleQuoteMode = 2
" let g:AutoPairsDoubleQuoteMode = 2
" let g:AutoPairsShortcutFastWrap = '<a-a>'
" let g:AutoPairsShortcutJump = '<a-w>'
" let g:AutoPairsShortcutToggle = ''
" let g:AutoPairsShortcutBackInsert = '<a-b>' " only for flymode

if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/neoterm.vim")) && empty($NOCOC)
    source $XDG_CONFIG_HOME/nvim/modules/neoterm.vim
endif

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
"======================
" RAINBOW PARENTHESIS
"======================
let g:rainbow_active = 0

"==============
"VIM-TEST
"==============
"If projectionist.vim is present,
"you can run a test command from an application file,
"and test.vim will automatically try to run the
"command on the "alternate" test file.

nmap <silent> <leader>Tn :TestNearest<CR>
nmap <silent> <leader>Tf :TestFile<CR>
nmap <silent> <leader>Ts :TestSuite<CR>
nmap <silent> <leader>Tl :TestLast<CR>
nmap <silent> <leader>Tg :TestVisit<CR>
" https://github.com/vim-test/vim-test
"
" PROJECTIONIST INTEGRATION                       *test-projectionist*

" If the |projectionist| plug-in is present, you can run a test command from an
" application file, and test.vim will automatically try to run the
" command on the "alternate" test file.

" You can disable this integration by doing
" >
  " let g:test#no_alternate = 1
" <

" let test#strategy = "dispatch"
let test#strategy = "neoterm"

autocmd BufReadPost * let test#project_root = git#find_current_root(1)

augroup TestType
" autocmd User ProjectionistActivate call <SID>choose_test_runner()
autocmd User ProjectionistActivate call <SID>get_testrunner()
augroup END

function s:get_testrunner()
  " better way to do this? FileType autocmd didnt work

  " if defined in projectionist, choose it, otherwise, let the plugin choose
  let l:value = projectionist#query('testrunner')
  if len(value) < 1
    return
  endif
  let l:value = l:value[-1][1]
  let l:extensions = ['ts', 'scala', 'js', 'py', 'java', 'rs', 'go', 'php']

  if index(l:extensions, g:extension) >= 0 " si esta en el arreglo
    if g:extension == "py"
      let g:test#python#runner = l:value
      return
    endif
    if g:extension == "java"
      let g:test#java#runner = l:value
      return
    endif
    if g:extension == "ts"
      let g:test#typescript#runner = l:value
      return
    endif
    if g:extension == "js"
      let g:test#javascript#runner = l:value
      return
    endif
    if g:extension == "go"
      let g:test#go#runner = l:value
      return
    endif
    if g:extension == "rs"
      let g:test#rust#runner = l:value
      return
    endif
    if g:extension == "scala"
      let g:test#scala#runner = l:value
      return
    endif
    if g:extension == "php"
      let g:test#php#runner = l:value
      return
    endif
  endif
endfunction

function s:choose_test_runner()
autocmd FileType python let g:test#python#runner = projectionist#query('testrunner')[1][1]
autocmd FileType javascript,typescript let g:test#javascript#runner = projectionist#query('testrunner')[1][1]
  autocmd FileType java let g:test#java#runner = projectionist#query('testrunner')[1][1]
  autocmd FileType go let g:test#go#runner = projectionist#query('testrunner')[1][1]
  autocmd FileType scala let g:test#scala#runner = projectionist#query('testrunner')[1][1]
  autocmd FileType php let g:test#php#runner = projectionist#query('testrunner')[1][1]
endfunction


" let test#strategy = "neoterm"
" let g:test#runner_commands = ['DjangoTest']
" Runners available are 'gotest', 'ginkgo', 'richgo', 'delve'
" let test#java#runner = 'gradletest'
" let test#php#phpunit#executable = 'phpunit artisan test'

" The following setup will automatically run tests when a test file or its alternate application file is saved:

" augroup test
"   autocmd!
"   autocmd BufWrite * if test#exists() |
"     \   TestFile |
"     \ endif
" augroup END

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
" nnoremap <silent><F3> :MaximizerToggle<CR>
" vnoremap <silent><F3> :MaximizerToggle<CR>gv
"
let g:maximizer_set_default_mapping = 0
nnoremap <silent><leader>m :MaximizerToggle<CR>
vnoremap <silent><leader>m :MaximizerToggle<CR>gv
" inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

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
" nnoremap <leader>.v :VimBeGood<cr>
" nnoremap <leader>.w :VimApm<cr>
" nnoremap <leader>.s :VimApmShutdown<cr>


"========================
" VIM-BUJO
"========================
let g:bujo#window_width = 90
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
map <silent><leader><leader>g <Plug>(BujoGlobal)
map <silent><leader><leader>p <Plug>(BujoProject)
map <silent><leader><leader>P <Plug>(BujoPrivate)

map <M-,> <Plug>(BujoAddnormal)
imap <M-,> <Plug>(BujoAddinsert)
map <M-.> <Plug>(BujoChecknormal)
imap <M-.> <Plug>(BujoCheckinsert)

"========================
" VIM-PROJECTIONIST
"========================
"
" heuristics, for general files

function! SetProjections()
  let l:global_projection = $FILES . "/projections/global/.projections.json"
  let l:json = readfile(l:global_projection)
  let l:dict = projectionist#json_parse(l:json)
  call projectionist#append(getcwd(), l:dict)
endfunction
" when a projection is found
if filereadable($FILES . "/projections/global/.projections.json")
  autocmd User ProjectionistDetect :call SetProjections()
endif

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

"==========
"DOTENV
"==========
function! s:env(var) abort
  return exists('*DotenvGet') ? DotenvGet(a:var) : eval('$'.a:var)
endfunction

let db_url = s:env('DATABASE_URL')

"==========
"CHEATSHEET
"==========
"vim.g.cheat_default_window_layout = 'split'
nnoremap <silent> <leader>K :Cheat<cr>
"===================
"FUZZY-PROJECTIONIST
"===================
" do F and any movement command for fuzzy search, examgle Fmodels

