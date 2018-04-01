
if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent` > /dev/null
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -l > /dev/null || ssh-add

source ~/antigen.zsh
antigen init .antigenrc

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias start-i3='~/.config/i3/start-i3.sh'
alias start-bspwm='~/.config/bspwm/start-bspwm.sh'

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
neofetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

XDG_CONFIG_HOME="$HOME/.config"
