
dir=$PWD

# .vimrc
ln -sf $dir/.vimrc ~/.vimrc

# .vim
rm -rf ~/.vim/
ln -sf $dir/.vim/ ~/.vim

# .bashrc
ln -sf $dir/.bashrc ~/.bashrc

# awesome WM
rm -rf ~/.config/awesome
ln -sf $dir/.config/awesome ~/.config/awesome

# atom
rm -rf ~/.atom
ln -sf $dir/.atom ~/.atom

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
