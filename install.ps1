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

$directory = Split-Path -Path $PSCommandPath -Parent

if (!(Test-Path -Path "${HOME}/.vimrc")) {
    New-Item -ItemType SymbolicLink -Path $HOME -Name ".vimrc" -Target "$directory/vimrc" -ErrorAction Stop
}

if (!(Test-Path -Path "${HOME}/.agignore")) {
    New-Item -ItemType SymbolicLink -Path $HOME -Name ".agignore" -Target "$directory/ignore" -ErrorAction Stop
}

if (!(Test-Path -Path "${HOME}/.ignore")) {
    New-Item -ItemType SymbolicLink -Path $HOME -Name ".ignore" -Target "$directory/ignore" -ErrorAction Stop
}

# Check that line starts with Plugin (potentially with whitespace before it)
# we don't want to install a plugin that may have been commented out
$regex = "^\s*Plugin\s+'(.+)'"

Push-Location

Get-Content -Path "$HOME/.vimrc" | Where-Object { $_ -match $regex } | ForEach-Object {
    $repo = ($_ | Select-String -Pattern $regex).Matches[0].Groups[1].ToString()
    $dirname = $repo.Split('/')[1]
    $destination = "$HOME/.vim/bundle/$dirname"

    Write-Host "Processing Plugin $dirname"

    # Pull updates if there or install if not there
    if (Test-Path -Path $destination) {
        Set-Location -Path $destination
        git pull
    } else {
        git clone https://github.com/$repo $destination
        Set-Location -Path $destination
    }

    git submodule update --init --recursive
}

$ycmDir = "$HOME/.vim/bundle/YouCompleteMe"
if ($BuildYouCompleteMe -And (Test-Path -Path $ycmDir)) {
    Set-Location -Path $ycmDir
    python ./install.py --all
}

Pop-Location

if ($Fonts) {
    git clone https://github.com/powerline/fonts.git --depth=1
    Set-Location -Path ./fonts
    ./install.ps1

    Set-Location -Path ..
    Remove-Item -Recurse -Force fonts
}
