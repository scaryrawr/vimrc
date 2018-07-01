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
    [switch]$BuildYouCompleteMe = $false
)

copy vimrc $HOME/.vimrc
copy ignore $HOME/.agignore
copy ignore $HOME/.ignore

# Check that line starts with Plugin (potentially with whitespace before it)
# we don't want to install a plugin that may have been commented out
$regex = "^\s*Plugin\s+'(.+)'"

Push-Location

Get-Content -Path $HOME/.vimrc | Where-Object { $_ -match $regex } | ForEach-Object {
    $repo = ($_ | Select-String -Pattern $regex).Matches[0].Groups[1].ToString()
    $dirname = $repo.Split('/')[1]
    $destination = "$HOME/.vim/bundle/$dirname"

    # Pull updates if there or install if not there
    if (Test-Path -Path $destination) {
        Set-Location -Path $destination
        git pull
    } else {
        git clone https://github.com/$repo $destination
    }
}

$ycmDir = "$HOME/.vim/bundle/YouCompleteMe"
if ($BuildYouCompleteMe -And (Test-Path -Path $ycmDir)) {
    Set-Location -Path $ycmDir

    # Error message on linux
    git submodule update --init --recursive

    python ./install.py --all
}

Pop-Location

if ($Fonts) {
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.ps1

    cd ..
    Remove-Item -Recurse -Force fonts
}
