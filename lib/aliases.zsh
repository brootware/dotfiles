#
# Aliases
#

# Enable aliases to be sudo’ed
#   http://askubuntu.com/questions/22037/aliases-not-available-when-using-sudo
alias sudo='sudo '

_exists() {
  command -v $1 > /dev/null 2>&1
}

# Just bcoz clr shorter than clear
alias clr='clear'

# Go to the /home/$USER (~) directory and clears window of your terminal
alias q="~ && clear"

# Folders Shortcuts
[ -d ~/Downloads ]            && alias dl='cd ~/Downloads'
[ -d ~/Desktop ]              && alias dt='cd ~/Desktop'
[ -d ~/Projects ]             && alias pj='cd ~/Projects'
[ -d ~/Projects/Forks ]       && alias pjf='cd ~/Projects/Forks'
[ -d ~/Projects/Job ]         && alias pjj='cd ~/Projects/Job'
[ -d ~/Projects/Playground ]  && alias pjl='cd ~/Projects/Playground'
[ -d ~/Projects/Repos ]       && alias pjr='cd ~/Projects/Repos'

# Commands Shortcuts
alias e="$EDITOR"
alias -- +x='chmod +x'
alias x+='chmod +x'

# Open aliases
alias open='open_command'
alias o='open'
alias oo='open .'
alias term='open -a iterm.app'

# Run scripts
alias update="source $DOTFILES/scripts/update"
alias bootstrap="source $DOTFILES/scripts/bootstrap"

# Quick jump to dotfiles
alias dotfiles="code $DOTFILES"

# Quick reload of zsh environment
alias zshup="source ~/.zshrc"

# Show $PATH in readable view
alias path='echo -e ${PATH//:/\\n}'

# Download web page with all assets
alias getpage='wget --no-clobber --page-requisites --html-extension --convert-links --no-host-directories'

# Download file with original filename
alias get="curl -O -L"

# Use tldr as help util
if _exists tldr; then
  alias help="tldr"
fi

alias git-root='cd $(git rev-parse --show-toplevel)'

if _exists lsd; then
  unalias ls
  alias ls='lsd'
  alias lt='lsd --tree'
fi

# cat with syntax highlighting
# https://github.com/sharkdp/bat
if _exists bat; then
  # Run to list all themes:
  #   bat --list-themes
  export BAT_THEME='base16'
  alias cat='bat'
fi

# kubectl alias
alias k=kubectl
complete -o default -F __start_kubectl k

#terraform alias
alias tf=terraform

if ls --color > /dev/null 2>&1; then 
    colorflag="--color"
else 
    colorflag="-G"
fi

# List all files colorized in long format
alias l="ls -lhF ${colorflag}"
# List all files colorized in long format, including dot files
alias la="ls -lahF ${colorflag}"

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias pubip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"
alias ips="sudo ifconfig -a | grep -o 'inet6\\? \\(addr:\\)\\?\\s\\?\\(\\(\\([0-9]\\+\\.\\)\\{3\\}[0-9]\\+\\)\\|[a-fA-F0-9:]\\+\\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# vhosts
alias hosts='sudo vim /etc/hosts'

# untar
alias untar='tar xvf'

# Undo the last commit
alias uncommit="git reset HEAD~1"

# Open .zshrc in VSCode
alias zshconfig="code ~/.zshrc"

#################################################################################################################################
################################################ wsl 2 specific aliases ########################################################
#################################################################################################################################

# Sync wsl2 time
alias wsltsync="sudo hwclock -s"

# Open Windows user directory
alias windir="cd /c/Users/Ominb"

if [[ $(uname -a) == *"microsoft"* ]]; then     
    # copy working directory
    alias cwd='pwd | tr -d "\r\n" | clip.exe'
    # Pipe my public key to my clipboard.
    alias pubkey="more ~/.ssh/id_ed25518.pub | clip.exe | echo '=> Public key copied to pasteboard.'"
    # Open Explorer in current folder
    alias explorer="explorer.exe ."
else
    # copy working directory
    alias cwd='pwd | tr -d "\r\n" | xclip -selection clipboard'
    # Pipe my public key to my clipboard.
    alias pubkey="more ~/.ssh/id_ed25518.pub | xclip -selection clipboard | echo '=> Public key copied to pasteboard.'"
    # Open Explorer in current folder
    alias explorer="nautilus ."
fi