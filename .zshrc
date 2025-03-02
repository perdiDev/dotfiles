eval "$(oh-my-posh init zsh --config ~/perdidev.omp.toml)"

# Show neofetch when open terminal
neofetch

# source fzf in zsh
source <(fzf --zsh)

# Ghostty shell integration for Bash. This should be at the top of your bashrc!
 if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source ${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration
 fi

# Configure zinit
#
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma-continuum/history-search-multi-word

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

## aliasing 
# basic bash
alias ls='ls --color=auto'

# zed editor (IDE)
alias zed='zeditor --wait'

# laravel
alias art='php artisan'

# fzf preview to remove package in yay
alias yayrp="yay -Qq | fzf --multi --preview 'yay -Qi {1}' | xargs -ro yay -Rns"

# fzf preview to search package
alias yayip="yay -Slq | fzf --multi --preview 'yay -Si {1}' | xargs -ro yay -S"

