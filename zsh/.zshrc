
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


~/dotfiles/scripts/z/z.sh
screenfetch
