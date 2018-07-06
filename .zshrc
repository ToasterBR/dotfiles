export ZSH=/Users/toaster/.oh-my-zsh

plugins=(git osx docker)

source $ZSH/oh-my-zsh.sh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U promptinit && promptinit
prompt purity

if [ -z "$TMUX" ]; then
  base_session='toaster'
  # Create a new session if it doesn't exist
  tmux has-session -t $base_session || tmux new-session -d -s $base_session
  # Are there any clients connected already?
  client_cnt=$(tmux list-clients | wc -l)
  if [ $client_cnt -ge 1 ]; then
    session_name=$base_session"-"$client_cnt
    tmux new-session -d -t $base_session -s $session_name
    tmux -2 attach-session -t $session_name \; set-option destroy-unattached
  else
    tmux -2 attach-session -t $base_session
  fi
fi

# Keep open in a new Tmux window
exec ${read}

