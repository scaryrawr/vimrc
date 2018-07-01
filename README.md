# VIMRC

My .vimrc file, things I've found to get stuff working from the interwebs.

## Install

There are assumptions about already having [git](https://git-scm.com/), [curl](https://curl.haxx.se/),
which you can install using [Chocolatey](https://chocolatey.org/) (on Windows) or your package manager
of choice on other systems. It also assumes you are running in
[PowerShell](https://github.com/PowerShell/PowerShell) (which can be installed on Linux now!)


Open a powershell Window (does not need elevation), then you can run:
```
./install.ps1
```

It'll go through and install all plugins listed in the vimrc file.

## Powerline-Fonts

Passing `-Fonts` will install [Powerline-Fonts](https://github.com/powerline/fonts).

## YouCompleteMe

Passing `-BuildYouCompleteMe` will build [YouCompleteMe](https:://github.com/Valloric/YouCompleteMe)
currently with `--all` passed to the python script. Later updates will enable better build experience.
