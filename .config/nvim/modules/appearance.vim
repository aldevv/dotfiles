"===================
"for transparent vim
"===================

let g:makeTransparent=0
if g:makeTransparent
    "soft, medium and hard.
     hi! Normal ctermbg=none guibg=NONE
     hi! CursorLineNr gui=bold guifg=#fabd2f guibg=NONE
     " hi! folded ctermbg=yellow cterm=bold guifg=none guibg=NONE
endif

"deletes the signcolumn background
" highlight clear LineNr
" highlight CursorLineNr guifg=#050505
highlight clear SignColumn

set cursorline
set cursorcolumn
" for cursor color you need this st patch
" https://st.suckless.org/patches/osc_10_11_12/
" and use this
" let &t_SI = "\<Esc>]12;red\x7"

" use custom highlights (italics)
let custom_highlights = 1
if custom_highlights == 1
    autocmd FileType python call MyPythonHighlights()
    autocmd FileType javascript call MyJsHighlights()
    autocmd FileType java call MyJavaHighlights()
    autocmd FileType markdown call MyMarkdownHighlights()
endif



" use this to FOLLOW links in highlight groups (can make persistent in
" colorscheme changes)
function! g:HighGet(name)
    return 'guifg=' . synIDattr(synIDtrans(hlID(a:name)), "fg")
endfunction
function! s:HighGetEcho(name)
    echo 'guifg=' . synIDattr(synIDtrans(hlID(a:name)), "fg")
endfunction
command! -nargs=1 Hg call s:HighGetEcho(<f-args>)

"python gruvbox
function MyPythonHighlights()
    execute 'hi! pythonClassVar gui=italic '    . HighGet("pythonClassVar")
    execute 'hi! pythonImport   gui=italic '    . HighGet("pythonImport")
    execute 'hi! pythonBuiltinFunc gui=italic ' . HighGet("pythonBuiltinFunc")
    execute 'hi! pythonClass gui=italic '       . HighGet("Statement")
    match pythonClass /^class\s/
    " created python class highlight group
endfunction

function MyMarkdownHighlights()
  " can be keyword or match
  " syntax keyword myitalics "myword"
  " syntax match myitalics "\v_.+_"
  " hi link myitalics htmlItalic
    execute 'hi! htmlItalic gui=italic ' . HighGet("htmlItalic")
endfunction

" to create a highlight group
" hi! pythonClass   gui=italic ctermfg=109 guifg=#83a598
" match pythonClass /^class\s/

" Js colors
" ________________
" find the highlight group using SyntaxQuery (on top of the desired item)
" then use :hi <name> to find the details of that item, do it as many times
" you need until you find the root colors
"
function MyJsHighlights()
    execute 'hi! jsImport         gui=italic ' . HighGet("jsImport")
    execute 'hi! jsFrom           gui=italic ' . HighGet("jsFrom")
    execute 'hi! jsClassKeyword   gui=italic ' . HighGet("jsClassKeyword")
    execute 'hi! jsExtendsKeyword gui=italic ' . HighGet("jsExtendsKeyword")
endfunction

function MyJavaHighlights()
    execute 'hi! javaIdentifier  guifg=#F5F5F5'
    execute 'hi! javaType         gui=italic ' . HighGet("javaType")
endfunction

 execute 'hi! lineNr guibg=NONE ' . HighGet("lineNr")


let g:java_highlight_all = 1
"let java_highlight_functions = 1
"
" to see the type of highlight SyntaxQuery
function! s:syntax_query() abort
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
command! SyntaxQuery call s:syntax_query()

"===============
" FOLDING
"===============

function! FoldForJava()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^\s+(private|public|protected)?\s+\S+\s+\S+\s+\S+\s*\(.*\)\s*\{$') > -1
        return ">1"
    elseif match(line, '\v^\s*(for|while)\s*\(.+\)\s*?\{') > -1
        return ">2"
    elseif match(line, '\v^\s*if\s*\(.+\)') > -1
        return ">3"
    else
        return "="
    endif
endfunction

function! FoldForPython()
" the smaller the number, the more priority it has
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^class\s+\S+\(?.+\)?\s?:') > -1
        return ">3"
    elseif match(line, '\v^\s*def\s\S+\(.*\)\s?:') > -1
        return ">4"
    elseif match(line, '\v^\s+(if|for|while)\s.+\s?:$') > -1
        return ">5"
    elseif match(line, '\v^(if|for|while).+\s?:$') > -1
        return ">2"
    elseif match(line, '\v^\S+\s?\=\s?.+$') > -1
        return ">0"
    else
        return "="
    endif
endfunction

function! FoldForJavascript()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^class\s.+\{$') > -1
        return ">1"
    elseif match(line,'\v^\s*function\s+\S+\(.*\)\s*\{$') > -1
        return ">2"
    elseif  match(line,'\v^\s*(if)@!(while)@!(for)@!.*\(.*\)\s*\{$') > -1
        return ">2"
    elseif  match(line,'\v^\s*\S+\s?\=\s?\(.*\)\s?\=\>.+\{$') > -1
        return ">2"
    elseif match(line, '\v^\s*(for|while)\s*\(.+\)\s*\{?$') > -1
        return ">3"
    elseif match(line, '\v^\s*if\s*\(.+\)\s*\{?$') > -1
        return ">4"
    else
        return "="
    endif
endfunction

function! FoldForVim()
    let line = getline(v:lnum) "v:lnum gives you the line number
    if match(line,'\v^function!?\s.+$') > -1
        return ">2"
    elseif match(line, '\v^\s*(augroup|aug)\s(END)@!.+$') > -1
        return ">2"
    elseif match(line, '\v^\s*(if|for|while).+\(.+\)\s?$') > -1
        return ">1"
    elseif match(line, '\v^(endfunction|endif|augroup END)@!\S*$') > -1
        return ">0"
    else
        return "="
    endif
endfunction

autocmd FileType java setlocal foldmethod=expr foldexpr=FoldForJava()
autocmd FileType python setlocal foldmethod=expr foldexpr=FoldForPython()
autocmd FileType javascript setlocal foldmethod=expr foldexpr=FoldForJavascript()
autocmd FileType vim setlocal foldmethod=expr foldexpr=FoldForVim()
autocmd FileType c,cpp setlocal foldmethod=syntax


"================
" FORMATTING
"================
"
" autocmd FileType python setlocal formatprg=black\ -\ \
"             \--quiet\ \
"             \--line-length\ 100

autocmd FileType python setlocal formatprg=autopep8



