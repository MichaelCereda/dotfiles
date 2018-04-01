sudo pacman -S $(cat packages)
sudo yaourt -S $(cat packages-aur)
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

