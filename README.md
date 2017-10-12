VIMRC
=====
My .vimrc file, things I've found to get stuff working from the interwebs.

Install
=======
Windows
-------
There are assumptions about already having [git](https://git-scm.com/), [curl](https://curl.haxx.se/), which you can install using [Chocolatey](https://chocolatey.org/).


Open an elevated (might not need to be elevated) powershell Window, then you can run:
```
./install.ps1
```

It will install [Vundle](https://github.com/VundleVim/Vundle.vim), as well as [Powerline-Fonts](https://github.com/powerline/fonts).

The first time you open vim, you'll see a lot of error messages. Ignore them and in vim, type:
```
:PluginInstall
```
Afterwards, you can restart vim and everything should be fine.

To get YouCompleteMe working, follow their [instructions](https://github.com/Valloric/YouCompleteMe#installation).

OS X & Linux
------------
There as assumptions about having git and curl and other tools pre installed.

Run:
```
./install.sh
```

It will install [Vundle](https://github.com/VundleVim/Vundle.vim), as well as [Powerline-Fonts](https://github.com/powerline/fonts).

The first time you open vim, you'll see a lot of error messages. Ignore them and in vim, type:
```
:PluginInstall
```
Afterwards, you can restart vim and everything should be fine.

To get YouCompleteMe working, follow their [instructions](https://github.com/Valloric/YouCompleteMe#installation).
