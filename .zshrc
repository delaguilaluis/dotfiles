setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL

export PS1="%(?..%F{red}✘ %f)%T %1~ %F{green}%# %f"

# xclip alias
if [[ `uname -s` != 'Darwin' ]]; then
  alias -g pbcopy='xclip -selection clipboard'
  alias -g pbpaste='xclip -selection clipboard -o'
fi

# git completion
if ! [[ -f ~/.zsh/git-completion.zsh ]]; then
  mkdir -p ~/.zsh
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o ~/.zsh/git-completion.zsh
fi
fpath=(~/.zsh $fpath)
