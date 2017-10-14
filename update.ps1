<#
.SYNOPSIS
    Copies the .vimrc over current .vimrc so you can update in git repo
.DESCRIPTION
    Copies the .vimrc over current .vimrc so you can update in git repo
.EXAMPLE
    C:\PS> ./update.ps1
#>

copy vimrc $HOME\.vimrc
copy ignore $HOME\.agignore
copy ignore $HOME\.ignore
