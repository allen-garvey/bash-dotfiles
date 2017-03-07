#SUBLIME

#open sublime workspace in current directory if there is one, otherwise open folder in sublime
alias sp="if [ -f *.sublime-workspace ]; then subl *.sublime-workspace; else subl .; fi"