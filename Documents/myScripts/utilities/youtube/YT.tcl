#!/usr/bin/expect --
#https://hsszyman.github.io/posts/browsing-youtube-with-dmenu/
set search [exec $env(UTILITIES)/youtube/fetch 1]
puts $search
# puts is simply an echo in the terminal, spawn runs the main command
eval spawn youtube-viewer --player=mpv $search
expect -re "=>>"
set out $expect_out(buffer)
set choice [exec $env(UTILITIES)/youtube/fetch $out $out]

send -- "$choice \n"
wait
#exec runs a command and saves its output
#eval concatenates all of its arguments into a single string, and runs them
#expect_out(buffer) saves all output until it finds latest
# expect pattern https://person.hst.aau.dk/magnus/EDB/expect_tutorialnotes3.pdf
