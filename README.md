VIMRC
=====
My .vimrc file, things I've found to get stuff working from the interwebs.

Install
=======
Windows
-------
There are assumptions about already having [git](https://git-scm.com/), [curl](https://curl.haxx.se/), which you can install using [Chocolatey](https://chocolatey.org/).


Open a powershell Window (does not need elevation), then you can run:
```
./install.ps1
```

It will install [Vundle](https://github.com/VundleVim/Vundle.vim).
As well as [Powerline-Fonts](https://github.com/powerline/fonts) if `-Fonts` is set.
Runs after the first run need `-Update` otherwise it'll try installing Vundle again.

The first time you open vim, you'll see a lot of error messages. Ignore them and in vim, type:
```
:PluginInstall
```
Afterwards, you can restart vim and everything should be fine.
