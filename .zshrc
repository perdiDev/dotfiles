# Show neofetch when open terminal
neofetch

# source fzf in zsh
source <(fzf --zsh)

# Ghostty shell integration for Bash. This should be at the top of your bashrc!
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source ${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

