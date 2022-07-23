export ZSH="/home/bpicori/.oh-my-zsh"

ZSH_THEME="robbyrussell"


# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git node nvm npm pip python rust deno
  zsh-autosuggestions zsh-completions 
  zsh-syntax-highlighting autojump fzf 
  golang kubectl minikube docker zsh-wakatime
  scd redis-cli postgres helm tmux taskwarrior flutter zoxide
)

source $ZSH/oh-my-zsh.sh

# Example aliases
alias zshconfig="vim ~/.zshrc"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=60"

# Breshka
fortune | cowsay -f tux | lolcat

# bin folder in home
PATH=~/bin:$PATH

# Gopath
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=$HOME/tools/lua-language-server/bin:$PATH

# k8
alias kcd='kubectl config set-context $(kubectl config current-context) --namespace '
alias kcc='kubectl config use-context '
alias klo='kubectl logs -f --tail 30 --timestamps=true '

# neovim
alias vim=nvim
alias ls=lsd

eval "$(starship init zsh)"
alias python=python3


jumpFzf() {
  cd $(autojump --stat | grep '/' | sort --numeric-sort | awk  '{print $2}' | fzf --tac +s)
}

bindkey -s "^[p" "jumpFzf^M"



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/bpicori/.sdkman"
[[ -s "/home/bpicori/.sdkman/bin/sdkman-init.sh" ]] && source "/home/bpicori/.sdkman/bin/sdkman-init.sh"


pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
 zstyle :bracketed-paste-magic paste-init pasteinit
 zstyle :bracketed-paste-magic paste-finish pastefinish


export PATH="${PATH}:${HOME}/.local/bin/"
export PATH="/home/bpicori/.deta/bin/:$PATH"

alias luamake=/home/bpicori/Projects/Test/lua-language-server/3rd/luamake/luamake


[ -f "/home/bpicori/.ghcup/env" ] && source "/home/bpicori/.ghcup/env" # ghcup-env

export DENO_INSTALL="/home/bpicori/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# the fuck setup
eval $(thefuck --alias)


# tmux font fix
export TERM=xterm-256color
export LC_ALL=en_US.UTF-8

# Browser default
export BROWSER='/usr/bin/google-chrome-stable'           # default web browser



export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
