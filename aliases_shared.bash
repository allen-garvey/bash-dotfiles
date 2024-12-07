#SETTINGS shared between macOS and linux
SHARED_INCLUDES_DIR="${DOTFILES_DIR}shared_includes/"

#alias for bash settings
alias dotfiles="cd \"$DOTFILES_DIR\""
#update dotfiles
alias update="git -C \"$DOTFILES_DIR\" pull && reload"

#set input mode to vi
set -o vi

#set vim as default editor for git and other programs
export VISUAL=vim
export EDITOR="$VISUAL"

#basic shell directory traversal and finding things
source "${SHARED_INCLUDES_DIR}shell.bash"
source "${SHARED_INCLUDES_DIR}filesystem.bash"
source "${SHARED_INCLUDES_DIR}sublime.bash"
source "${SHARED_INCLUDES_DIR}vs_code.bash"
source "${SHARED_INCLUDES_DIR}net.bash"
source "${SHARED_INCLUDES_DIR}rsync.bash"
source "${SHARED_INCLUDES_DIR}directories.bash"
source "${SHARED_INCLUDES_DIR}git.bash"
# source "${SHARED_INCLUDES_DIR}django.bash"
source "${SHARED_INCLUDES_DIR}phoenix.bash"
source "${SHARED_INCLUDES_DIR}redis.bash"
source "${SHARED_INCLUDES_DIR}zip.bash"
source "${SHARED_INCLUDES_DIR}daemon.bash"
source "${SHARED_INCLUDES_DIR}npm.bash"
source "${SHARED_INCLUDES_DIR}docker.bash"
source "${SHARED_INCLUDES_DIR}postgres.bash"
# source "${SHARED_INCLUDES_DIR}youtube.bash"
source "${SHARED_INCLUDES_DIR}video.bash"
source "${SHARED_INCLUDES_DIR}image.bash"
source "${SHARED_INCLUDES_DIR}logs.bash"
