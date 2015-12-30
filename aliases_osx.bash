source "${DOTFILES_DIR}aliases_shared.bash"

#SETTINGS for OSX only

#alias for bash settings
alias settings="subl ~/.bash_profile \"./${DOTFILES_DIR}\""

#BUILT INS

alias grepc="grep -nr --color=always"


#CUSTOM SCRIPTS



#SUBLIME

#alias for sublime
alias subl="open -a \"Sublime Text 3\""

#alias for sublime packages
alias subl_settings="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime-snippets; open ."

#Directories

#alias to open current directory in finder
function op() { open ./$1; }

#Git

#alias to open current directory in gitup
alias gitup="open . -a \"GitUp\""

#RAILS

#Convenience
#start developing on existing web project in current directory (develop web)
alias dw="op;gitup;subl .;"

#Django

#open new tab - add command to do it in new tab
# http://stackoverflow.com/questions/7171725/open-new-terminal-tab-from-command-line-mac-os-x
function tab() {
  osascript 2>/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end
    tell application "Terminal"
      activate
      do script with command "cd \"$PWD\"; $*" in window 1
    end tell
EOF
}

#apache

alias apache_config="cd /etc/apache2;op;prog Configuration/apache_config;subl .;gitup;"

#fonts
alias fonts="cd ~/Library/fonts;op;"
