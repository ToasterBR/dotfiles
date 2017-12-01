export ZSH=/Users/toaster/.oh-my-zsh

ZSH_THEME="spaceship"

plugins=(git)

source $ZSH/oh-my-zsh.sh

alias vim='mvim'
alias v='vim'
alias n='v /Users/toaster/Google\ Drive/Work/Notes .'

export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export BYOBU_PREFIX=/usr/local
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source "/Users/toaster/.oh-my-zsh/custom/themes/spaceship.zsh-theme"
