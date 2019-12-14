export PS1="\A \W \[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"

# xclip
which -s pbcopy || alias pbcopy='xclip -selection clipboard'
which -s pbpaste || alias pbpaste='xclip -selection clipboard -o'
