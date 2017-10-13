cp vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh

cd ..
rm -rf fonts
