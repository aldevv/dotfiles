autocmd! BufRead,BufNewFile docker-compose.yml  set filetype=docker-compose.yml syntax=yaml
au! BufNewFile,BufReadPost *.{yaml,yml} setfiletype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

