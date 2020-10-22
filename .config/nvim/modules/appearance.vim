" sets 24 bit term colors for vim
set termguicolors
 set t_8f=\[[38;2;%lu;%lu;%lum
 set t_8b=\[[48;2;%lu;%lu;%lum

" fix colors for highlighting spelling mistakes
autocmd ColorScheme gruvbox hi! SpellBad cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828

set pumblend=15
" Theme
"colorscheme onehalfdark
"colorscheme dracula
" set background=dark
" colorscheme gruvbox
"try codedark
" gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"
" let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
"
set background=dark
let current_colorscheme = 1
if current_colorscheme == 1
    colorscheme gruvbox
endif
if current_colorscheme == 2
    colorscheme dracula
endif
if current_colorscheme == 3
    colorscheme codedark
endif
if current_colorscheme == 4
    colorscheme fahrenheit
endif

" use custom highlights (italics)
let custom_highlights = 1
if custom_highlights == 1
    autocmd FileType python call MyPythonHighlights()
    autocmd FileType javascript call MyJsHighlights()
endif

"===================
"for transparent vim
"===================

 " hi! Normal ctermbg=none guibg=NONE
 " hi! CursorLineNr gui=bold guifg=#fabd2f guibg=NONE
 " hi! folded guifg=none guibg=NONE
"
if g:colors_name == "gruvbox"
    "soft, medium and hard.
"      hi! Normal ctermbg=none guibg=NONE
"      hi! CursorLineNr gui=bold guifg=#fabd2f guibg=NONE
"      hi! folded ctermbg=yellow cterm=bold guifg=none guibg=NONE
endif

" if g:colors_name == "fahrenheit"
"      hi! Normal ctermbg=none guibg=NONE
"      hi! CursorLineNr gui=bold guifg=#fabd2f guibg=NONE
"      hi! folded ctermbg=yellow cterm=bold guifg=none guibg=NONE
"     " other custom overrides
" endif

"deletes the signcolumn background
" highlight clear LineNr
" highlight CursorLineNr guifg=#050505
highlight clear SignColumn

set cursorline
" set cursorcolumn
" highlight! CursorLine guibg=none

" to see the type of highlight SyntaxQuery
function! s:syntax_query() abort
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
endfunction
command! SyntaxQuery call s:syntax_query()


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

 execute 'hi! lineNr guibg=NONE ' . HighGet("lineNr")

"Themes
"https://github.com/vim-airline/vim-airline/wiki/Screenshots
"
" let g:airline_theme='luna'
" let g:airline_theme='gruvbox'
let g:airline_theme='minimalist'
 
"https://ncona.com/2019/02/the-vim-statusline/
"let g:airline_theme='onehalfdark'
"let g:airline_theme='gruvbox'
"show buffers active on top
