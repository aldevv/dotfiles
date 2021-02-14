function git#push(path, comment)
  let git_command = 'git -C ' . a:path
  let add = git_command .  ' add . ' 
  let commit = git_command . ' commit -m ' . a:comment . ' '
  let push = git_command . ' push origin master'
  silent exec 'Start! -wait=never ' . add . '&& ' . commit . '&& ' . push
endfunction
