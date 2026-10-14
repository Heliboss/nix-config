# ctrl-z: resume last background job, else undo
bind \cz 'fg 2>/dev/null || commandline -f undo'

# ctrl-o: copy command line to the clipboard
bind ctrl-o 'commandline | wl-copy'
