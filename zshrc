export DOTFILES_ROOT="$HOME/.dotfiles"

# Path to your oh-my-zsh configuration.
ZSH="$DOTFILES_ROOT/oh-my-zsh"
ZSH_CUSTOM="$DOTFILES_ROOT/oh-my-zsh-custom"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

system=`uname -s`

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git npm rails ruby rake-fast bundler git-extras pow rvm svn \
  zsh-syntax-highlighting zsh-256color tmux colored-man-pages)
if [[ "$system" != 'Linux' ]]; then
  plugins+=(osx)
fi

source $ZSH/oh-my-zsh.sh
unsetopt correct

export EDITOR="vim"

bindkey '^R' history-incremental-search-backward

fpath=("$DOTFILES_ROOT/zsh-completions" $fpath)

if [[ "$system" == 'Linux' ]]; then
  alias ll='ls -lha --group-directories-first'

  # # For Github SSH Keys
  # SSH_ENV="$HOME/.ssh/environment"
  #
  # function start_agent {
  #   echo "Initialising new SSH agent..."
  #   /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
  #   echo succeeded
  #   chmod 600 "${SSH_ENV}"
  #   . "${SSH_ENV}" > /dev/null
  #   /usr/bin/ssh-add;
  # }
  #
  # # Source SSH settings, if applicable
  # if [ -f "${SSH_ENV}" ]; then
  #   . "${SSH_ENV}" > /dev/null
  #   ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
  #     start_agent;
  #   }
  # else
  #   start_agent;
  # fi

else
  fpath=("$DOTFILES_ROOT/zsh-completions-osx" $fpath)
  alias ll='ls -lha'
fi

# Keypad enter
bindkey -s "^[OM" "^M"

alias tar='gtar'

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

eval "$(rbenv init -)"
