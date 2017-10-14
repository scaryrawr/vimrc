<#
.SYNOPSIS
    Installs some dependencies and sets up .vimrc
.DESCRIPTION
    Installs powerline fonts, vundle, and copies .vimrc to
    the home directory.
.EXAMPLE
    C:\PS> ./install.ps1
#>

copy vimrc $HOME\.vimrc
copy ignore $HOME\.agignore
copy ignore $HOME\.ignore

git clone https://github.com/VundleVim/Vundle.vim.git $HOME\.vim\bundle\Vundle.vim

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.ps1

cd ..
Remove-Item -Recurse -Force fonts
