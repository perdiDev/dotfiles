eval "$(oh-my-posh init zsh --config ~/.perdidev.omp.toml)"

# Show neofetch when open terminal
echo -e "\n" && fastfetch

# source fzf in zsh
source <(fzf --zsh)

# Ghostty shell integration for Bash. This should be at the top of your bashrc!
 if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source ${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration
 fi

# Configure zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zdharma-continuum/fast-syntax-highlighting

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# init light jeffreytse/zsh-vi-mode

bindkey -v
bindkey '^P' up-line-search
bindkey '^N' down-line-search

# Basic option
setopt autocd
setopt correct
setopt interactivecomments
setopt notify

# Env variable
export EDITOR=nvim visudo
export VISUAL=nvim visudo
export SUDO_EDITOR=nvim
export FCEDIT=nvim
export BROWSER=com.zen.browser

# History config
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE

# aliasing 
# basic bash
alias c='clear'

alias ls='ls --color=auto'

# zed editor (IDE)
alias zed='zeditor --wait'

# laravel
alias art='php artisan'

# fzf preview to remove package in yay
alias yayrp="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"

# fzf preview to search package
alias yayip="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"


# bun completions
[ -s "/home/perdidev/.bun/_bun" ] && source "/home/perdidev/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
