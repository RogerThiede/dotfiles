#!/bin/bash

# Check for Xcode Command Line Tools
xcode-select -p
if (($? == 2)); then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
fi

# Check for Homebrew
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update any existing homebrew recipes
brew update

# Check for Python pip
if test ! $(which pip3); then
    echo "python pip needs to be installed in order to install cider."
    echo "Installing python (with built in python pip)..."
    brew install python
    echo "Updating python pip and python setuptools..."
    pip3 install --upgrade pip setuptools
fi

# Check for Cider
if test ! $(which cider); then
    echo "Installing cider..."
    pip3 install --upgrade cider
fi

cider restore

# Install oh-my-zsh
export ZSH=~/Documents/git/oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

