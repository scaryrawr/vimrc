# VIMRC

My .vimrc file, things I've found to get stuff working from the interwebs.

## Install

There are assumptions about already having [git][2], [curl][3],
which you can install using [Chocolatey][1] (on Windows) or your package manager
of choice on other systems. It also assumes you are running in
[PowerShell][4] (which can be installed on Linux now!)


Open a powershell Window (does not need elevation), then you can run:
```
./install.ps1
```

It'll go through and install all plugins listed in the vimrc file.

## Powerline-Fonts

Passing `-Fonts` will install [Powerline-Fonts][5].

## YouCompleteMe

Passing `-BuildYouCompleteMe` will build [YouCompleteMe][6]
currently with `--all` passed to the python script. Later updates will enable better build experience.

Please see prereqs below to avoid errors during build (some maybe missing).

### Prereqs

#### Windows

Most things can be installed using [Chocolatey][1]:

- vim (manually add to path)
- python2
- rust-ms
- cmake (manually add to path)
- golang
- jdk8
- llvm (manually add to path)
- nodejs +typescript
- curl
 
#### Linux

Most things should be able to be installed using your package manager:

- [powershell][4]
- [mono-devel][7]
- openjdk-8-jdk
- build-essential
- cmake
- python-dev
- git
- rustc
- cargo
- curl

[1]: https://chocolatey.org/
[2]: https://git-scm.com/
[3]: https://curl.haxx.se/
[4]: https://github.com/PowerShell/PowerShell
[5]: https://github.com/powerline/fonts
[6]: https://github.com/Valloric/YouCompleteMe
[7]: https://www.mono-project.com/download/stable/#download-lin
