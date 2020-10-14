" UndoTreeToggle
map <leader>u :UndotreeToggle<CR>

" NERDTreeToggle
" check mappings here
"https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt
map <leader>se :NERDTreeToggle<CR>
map <leader>lb :Bookmark<CR>

let NERDTreeMenuUp   = 'e'
let NERDTreeMenuDown = 'n'
let NERDTreeMapOpenExpl = 'k'
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

let NERDTreeMapOpenSplit = "s"
let NERDTreeMapPreviewSplit = "gs"
let NERDTreeMapOpenVSplit = "l"
let NERDTreeMapPreviewVSplit = "gl"
let NERDTreeMapJumpFirstChild = "E"
let NERDTreeMapJumpLastChild = "N"
let NERDTreeMapJumpPrevSibling = "<C-E>"
let NERDTreeMapJumpNextSibling = "<C-N>"
let NERDTreeMapToggleHidden = "<BS>"

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
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit' }
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
nmap g{ <Plug>(coc-diagnostic-prev)
nmap g} <Plug>(coc-diagnostic-next)
nmap <silent> <leader>,, <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>; <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart
nnoremap <silent> <leader>+ :call CocAction('doHover')<cr>
nmap <F2> <Plug>(coc-rename)

nnoremap <silent> <space>dd :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>ds :<C-u>CocList -I symbols<cr>
nmap <leader>da <Plug>(coc-codeaction)

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
   \ pumvisible() ? "\<C-n>" :
   \ <SID>check_back_space() ? "\<TAB>" :
   \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics (errors)
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

"Coc-snippets
"to scroll with tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
"imap <C-l> <Plug>(coc-snippets-expand)


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


" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" ultisnips
let g:UltiSnipsExpandTrigger='<c-s>' " TO USE SNIPPETS
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
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
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)

" devicons
" let g:webdevicons_enable = 1
" let g:DevIconsEnableFoldersOpenClose = 1
" let g:DevIconsEnableFolderExtensionPatternMatching = 1

" targets plugin
"

let g:targets_aiAI = 'alAL'
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
"
" Emmet
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
"Set let g:jupyter_mapkeys = 0 in your .vimrc to prevent the default keybindings from being made.
"
"
" Run current file
" nnoremap <buffer> <silent> <localleader>R :JupyterRunFile<CR>
" nnoremap <buffer> <silent> <localleader>I :PythonImportThisFile<CR>

" Change to directory of current file
" nnoremap <buffer> <silent> <localleader>d :JupyterCd %:p:h<CR>

" Send a selection of lines
" nnoremap <buffer> <silent> <localleader>X :JupyterSendCell<CR>
" nnoremap <buffer> <silent> <localleader>E :JupyterSendRange<CR>
" nmap     <buffer> <silent> <localleader>e <Plug>JupyterRunTextObj
autocmd FileType python nmap     <buffer> <silent> <localleader>c :JupyterConnect<cr>
" vmap     <buffer> <silent> <localleader>e <Plug>JupyterRunVisual

" nnoremap <buffer> <silent> <localleader>U :JupyterUpdateShell<CR>

" Debugging maps
" nnoremap <buffer> <silent> <localleader>b :PythonSetBreak<CR>

" polyglot
" removes annoying red highlight from every space you put
let g:python_highlight_space_errors = 0

" camelcase motion
let g:camelcasemotion_key = '<leader>'
map <silent> <leader>j <Plug>CamelCaseMotion_e
map <silent> <leader>gj <Plug>CamelCaseMotion_ge

" replace with register
nmap gp  <Plug>ReplaceWithRegisterOperator
nmap gpp <Plug>ReplaceWithRegisterLine
xmap gp  <Plug>ReplaceWithRegisterVisual
"USAGE						   *ReplaceWithRegister-usage*
"
"							     *gr* *grr* *v_gr*
"[count]["x]gr{motion}	Replace {motion} text with the contents of register x.
"			Especially when using the unnamed register, this is
"			quicker than "_d{motion}P or "_c{motion}<C-R>"
"[count]["x]grr		Replace [count] lines with the contents of register x.
"			To replace from the cursor position to the end of the
"			line use ["x]gr$
"{Visual}["x]gr		Replace the selection with the contents of register x.

" indent text object
let g:textobj_indent_no_default_key_mappings = 1
silent! TextobjIndentDefaultKeyMappings!
vmap li	<Plug>(textobj-indent-i)
omap li	<Plug>(textobj-indent-i)
vmap lI	<Plug>(textobj-indent-same-i)
omap lI	<Plug>(textobj-indent-same-i)
"
" line text object

let g:textobj_line_no_default_key_mappings = 1
silent! TextobjLineDefaultKeyMappings!
vmap <silent> ll <Plug>(textobj-line-i)
omap <silent> ll <Plug>(textobj-line-i)

" entire text object
let g:textobj_entire_no_default_key_mappings = 1
silent! TextobjEntireDefaultKeyMappings!
vmap <silent> le	<Plug>(textobj-entire-i)
omap <silent> le	<Plug>(textobj-entire-i)
