#SETTINGS for OSX

#Basic Shell Setup
#PS1 to mimic Ubuntu default terminal theme (ubuntu terminal background color is: #300a24)
#export PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
export PS1="\[\033[01;32m\]\h\[\033[00m\]:\w\$ "

#BUILT INS (declared before shared settings)
alias grepc="grep -nr --color=auto"

source "${DOTFILES_DIR}aliases_shared.bash"

#alias for bash settings
alias settings="subl ~/.bash_profile \"${DOTFILES_DIR}\""
alias reload="source ~/.bash_profile"


#REDIS
#assumes Redis is installed by homebrew
#starts redis as background daemon
alias redis_start="brew services start redis;"


#SUBLIME

#alias for sublime
alias subl="open -a \"Sublime Text 3\""

#alias for sublime packages
alias subl_settings="cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/sublime-snippets; open ."

#Directories

#alias to open current directory in finder
function op() { open ./$1; }


#Postgres.app - psql command
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

#Git

#alias to open current directory in gitup
alias gitup="open . -a \"GitUp\""
#open stack overflow to add part of file in git to staging
alias git_part="open \"http://stackoverflow.com/questions/1085162/commit-only-part-of-a-file-in-git\";"

#RAILS

#Convenience
#start developing on existing web project in current directory (develop web)
alias dw="op;gitup;subl .;"


#Applescript for terminal commands

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

#opens current active finder window/tab directory in terminal
function opf() {
  osascript 2>/dev/null <<EOF
	tell application "Finder"
		set current_directory to quoted form of POSIX path of (target of window 1 as alias)
		tell application "Terminal"
			do script "cd " & current_directory in window 1
		end tell
	end tell
EOF
}

#opens current site in `~/Sites` in browser at localhost
#The following works if you paste the body of the function directly in the shell, but when used as an
#alias or function, it opens site in Finder. Piping to sh is required to open in a browser when
#part of a function for some reason
#function open_site(){ pwd | sed -e 's|^.*/Sites|http://localhost|g' | { read url; open "$url"; }; }
function open_site(){ pwd | sed -e 's|^.*/Sites|http://localhost|g' | { read url; echo "open $url"; } | sh -s; }

#displays take a break notification
#based on: https://reberhardt.com/blog/2016/02/09/a-dead-simple-break-timer-for-mac.html
function breaktime() {
  TIME_INTERVAL=900
  MINUTES=$(expr $TIME_INTERVAL / 60)
  SECONDS=$(expr $TIME_INTERVAL % 60)
  echo "Break time started- you will be notified to take a break every $MINUTES minutes $SECONDS seconds"
  while true
  do
      #test to make sure computer screen is on (i.e. not asleep) - if power state 4 means display is on
      POWER_STATE=$(ioreg -n IODisplayWrangler | grep -i IOPowerManagement | sed 's/.*"CurrentPowerState"=\([0-9]\).*/\1/')
      if [ $POWER_STATE -ne 4 ]
      then
          break
      fi
      sleep $TIME_INTERVAL
      osascript -e 'display notification "Break time" with title "Rest your eyes!" sound name "Pop"'
  done
}

#apache
alias apache="sudo apachectl"
alias apache_config="cd /etc/apache2;op;prog Configuration/apache_config;subl .;gitup;"

#fonts
alias fonts="cd ~/Library/fonts;op;"


#calendar
#prints calendar for current month and next 2 months
#based on: http://unix.stackexchange.com/questions/182462/multi-month-view-in-calendar-cal-in-os-x
function caln() {
  month=$(date "+%m")
  year=$(date "+%Y")

  next_month=$(echo "($month + 1) % 13" | bc)
  next_year="$year"
  next_next_month=$(echo "($month + 2) % 13" | bc)
  next_next_year="$year"
  if [[ "$next_month" -eq "0" ]]; then
    next_month="1"
    next_next_month="2"
    next_year=$(echo "$year + 1" | bc)
    next_next_year="$next_year"
  fi
  if [[ "$next_next_month" -eq "0" ]]; then
    next_next_month="1"
    next_next_year=$(echo "$year + 1" | bc)
  fi
  paste <(cal "$month" "$year") \
      <(cal "$next_month" "$next_year") \
      <(cal "$next_next_month" "$next_next_year")
}

# copies ssh public key to clipboard
# from: https://secure.vexxhost.com/billing/knowledgebase/171/How-can-I-generate-SSH-keys-on-Mac-OS-X.html
alias copy_ssh="pbcopy < ~/.ssh/id_rsa.pub"












