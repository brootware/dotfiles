# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# ------------------------------------------------------------------------------

#
# ~/.zshrc
#
# ------------------------------------------------------------------------------
# Environment
# ------------------------------------------------------------------------------

# Do not override files using `>`, but it's still possible using `>!`
set -o noclobber

# Default pager
export PAGER='less'

# less options
less_opts=(
  # Quit if entire file fits on first screen.
  -FX
  # Ignore case in searches that do not contain uppercase.
  --ignore-case
  # Allow ANSI colour escapes, but no other escapes.
  --RAW-CONTROL-CHARS
  # Quiet the terminal bell. (when trying to scroll past the end of the buffer)
  --quiet
  # Do not complain when we are on a dumb terminal.
  --dumb
)
export LESS="${less_opts[*]}"

# Default editor for local and remote sessions
if [[ -n "$SSH_CONNECTION" ]]; then
  # on the server
  if [ command -v vim >/dev/null 2>&1 ]; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
else
  export EDITOR='vim'
fi

# Better formatting for time command
export TIMEFMT=$'\n================\nCPU\t%P\nuser\t%*U\nsystem\t%*S\ntotal\t%*E'

# ------------------------------------------------------------------------------
# Oh My Zsh
# ------------------------------------------------------------------------------
ZSH_DISABLE_COMPFIX=true

plugins=(
  history-substring-search
  battery
  git
  sudo
  extract
  ssh-agent
  gpg-agent
  gh
  vscode
  common-aliases
  command-not-found
  docker
)

# ------------------------------------------------------------------------------
# Dependencies
# ------------------------------------------------------------------------------

# Shell plugins
# eval "$(sheldon source)"
# # Per-directory configs
# if command -v direnv >/dev/null 2>&1; then
#   eval "$(direnv hook zsh)"
# fi

# ------------------------------------------------------------------------------
# Overrides
# ------------------------------------------------------------------------------

# Source local configuration
# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.aliases ]
then
  source ~/.aliases
fi

# ------------------------------------------------------------------------------

# Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"