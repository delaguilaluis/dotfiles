setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

# zsh auto-completions
autoload -Uz compinit
compinit

# delete key binding
bindkey "\e[3~" delete-char 

export PS1="%(?..%F{red}✘ %f)%T %1~ %F{green}%# %f"

# Linux pollyfills
if [[ `uname -s` != 'Darwin' ]]; then
  alias -g pbcopy='xclip -selection clipboard'
  alias -g pbpaste='xclip -selection clipboard -o'
  alias say='echo "$1" | espeak -s 120 2>/dev/null'
fi

# git completion
if ! [[ -f ~/.zsh/git-completion.zsh ]]; then
  mkdir -p ~/.zsh
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o ~/.zsh/git-completion.zsh
fi
fpath=(~/.zsh $fpath)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
