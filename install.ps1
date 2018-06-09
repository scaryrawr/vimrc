<#
.SYNOPSIS
    Installs some dependencies and sets up .vimrc
.DESCRIPTION
    Installs powerline fonts, vundle, and copies .vimrc to
    the home directory.
.EXAMPLE
    C:\PS> ./install.ps1
#>

param (
    [switch]$Fonts = $false,
    [switch]$Update = $false
)

copy vimrc $HOME/.vimrc
copy ignore $HOME/.agignore
copy ignore $HOME/.ignore

if (!$Update) {
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
}

if ($Fonts) {
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.ps1

    cd ..
    Remove-Item -Recurse -Force fonts
}
