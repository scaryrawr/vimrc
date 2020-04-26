#! /bin/sh

# Get directory containing vimrc and other settings
scriptPath=$(readlink -f "$0")
scriptDir=$(dirname "${scriptPath}")

# Use symbolic links to keep settings up-to-date in git repo

if [ ! -f ~/.vimrc ]; then
    ln -s ${scriptDir}/vimrc ~/.vimrc
fi

if [ ! -f ~/.agignore ]; then
    ln -s ${scriptDir}/ignore ~/.agignore
fi

if [ ! -f ~/.ignore ]; then
    ln -s ${scriptDir}/ignore ~/.ignore
fi

currentDir=$(pwd)

vimBundleDir=~/.vim/bundle
if [ ! -d ${vimBundleDir} ]; then
    mkdir -p ${vimBundleDir}
fi
cd ${vimBundleDir}

# Find all plugins and clone them in the bundle directory
sed -n "s/^Plugin\s'\(.*\)'/https:\/\/github.com\/\1/p" ~/.vimrc | xargs -L1 git clone --recurse-submodules

ycmDir=${vimBundleDir}/YouCompleteMe
if [ -d ${ycmDir} ]; then
    cd ${ycmDir}
    python ./install.py --all
fi

cd ${currentDir}
