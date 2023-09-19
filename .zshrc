setopt AUTO_CD
setopt CORRECT
setopt CORRECT_ALL
setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

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

# Node.js version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Macbook drivers
function fix_wifi() {
  sudo apt install linux-headers-$(uname -r) && sudo apt install broadcom-sta-common broadcom-sta-source broadcom-sta-dkms
  sudo modprobe -r b43
  sudo modprobe -r bcma
  echo "Reboot required for changes to take effect"
}

function fix_webcam() {
  cd /tmp
  sudo apt-get install git curl xzcat cpio
  git clone https://github.com/patjak/facetimehd-firmware.git
  cd facetimehd-firmware
  make
  sudo make install
  cd ..
  sudo apt-get install kmod libssl-dev checkinstall
  git clone https://github.com/patjak/bcwc_pcie.git
  cd bcwc_pcie
  make
  sudo make install
  sudo depmod
  sudo modprobe facetimehd
  cd ~
  echo "Reboot required for changes to take effect"
}
