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

# Check for Python pip
if test ! $(which pip); then
    echo "python pip needs to be installed in order to install cider."
    echo "Installing python (with built in python pip)..."
    brew install python
    brew linkapps python
    echo "Updating python pip and python setuptools..."
    pip install --upgrade pip setuptools
fi

# Check for Cider
if test ! $(which cider); then
    echo "Installing cider..."
    pip install --upgrade cider
fi
