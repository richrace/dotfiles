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

ZSH_DISABLE_COMPFIX="true"

# Overriding setting up history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

system=$(uname -s)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git npm rails ruby rake-fast bundler git-extras \
  zsh-syntax-highlighting zsh-256color tmux colored-man-pages docker)
if [[ "$system" != 'Linux' ]]; then
  plugins+=(macos)
fi

unsetopt correct

export EDITOR="vim"

bindkey '^R' history-incremental-search-backward

fpath=("$DOTFILES_ROOT/zsh-completions" $fpath)

if [[ "$system" == 'Linux' ]]; then
  alias ll='ls -lha --group-directories-first'
else
  fpath=("$DOTFILES_ROOT/zsh-completions-osx" $fpath)
  alias ll='ls -lha'
fi

# Keypad enter
bindkey -s "^[OM" "^M"

alias tar='gtar'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh

eval "$(rbenv init -)"

load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

if [[ $- == *i* ]]; then
  # If you have a custom load-nvmrc hook, put it here
  autoload -U add-zsh-hook
  add-zsh-hook chpwd load-nvmrc
  load-nvmrc
fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
pyenv() {
  unset -f pyenv
  eval "$(command pyenv init -)"
  pyenv "$@"
}

# export PATH="/usr/local/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

jdk() {
        version=$1
        export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
        java -version
 }

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:$HOME/.local/bin"

# pnpm
export PNPM_HOME="/Users/rich/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

alias npr="npm run"
compdef npr="npm"

alias decolourise="sed -r \"s/\x1B\[([0-9]{1,3}(;[0-9]{1,3})*)?[mGK]//g\""

function recent-branches() {
  git reflog show --pretty=format:'%gs ~ %gd' --date=relative \
    | grep 'checkout:' \
    | grep -oE '[^ ]+ ~ .*' \
    | awk -F~ '!seen[$1]++' \
    | head -n 10 \
    | awk -F' ~ HEAD@{' '{printf("  \033[33m%s: \033[37m %s\033[0m\n", substr($2, 1, length($2)-1), $1)}'
}

alias gtidy="git fetch --prune && git branch --no-color --merged main | grep -v '^\*\|main' | xargs git branch -d"
alias glgs="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias gr="recent-branches"

source $HOME/.bichardrc

# Custom Spaceship get toggled here. I don't know why
source $ZSH/oh-my-zsh.sh


