# Prompt
fpath+=$HOME/.zsh/pure

autoload -U promptinit
promptinit

PURE_CMD_MAX_EXEC_TIME=10

zstyle :prompt:pure:path color blue
zstyle ':prompt:pure:prompt:*' color cyan
zstyle :prompt:pure:git:stash show yes

prompt pure

# dircolors
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
alias ls='ls --color=auto'

# PATH alterations
## dotnet
export PATH="$PATH:$HOME/.dotnet/tools/"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

## Call `nvm use` automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Plugins
## zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_USE_ASYNC=true

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=10000
setopt appendhistory

## zsh-syntax-highlighting
# This must be at the end of this file
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
