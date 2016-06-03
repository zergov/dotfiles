dir=$PWD

# .vim
ln -sf $dir/.vimrc ~/.vimrc
rm -rf ~/.vim/
ln -sf $dir/.vim/ ~/.vim

# nvim
ln -sf $dir/.config/nvim/ ~/.config/nvim

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
