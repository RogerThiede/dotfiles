dotfiles
========
Your dotfiles are how you personalize your system. These are mine.

Installation
------------
Setup [oh-my-zsh](http://ohmyz.sh)
```bash
export ZSH=~/Documents/git/oh-my-zsh
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

Setup [Cider](https://pypi.python.org/pypi/cider/)

__Disclaimer:__ _I do not know if cider restore may overwrite pre-existing
files_

```bash
pip install --upgrade cider
git clone https://github.com/RogerThiede/dotfiles.git ~/.cider
cider restore
```

## Curious about my setup?
My system is reliant upon the
[Mac App Store](https://www.apple.com/osx/apps/app-store/),
[Homebrew](http://brew.sh), [Homebrew Cask](http://caskroom.io), and
[oh-my-zsh](http://ohmyz.sh).

After reviewing many different public dotfile systems, frameworks, and dotfile
utilities such as those summarized on the [unofficial guide to dotfiles on
GitHub](https://dotfiles.github.io), I discovered the simplicity offered by a
single tool called Cider that saves and restores your Homebrew and Homebrew
Cask setup as well as saving and restoring ~ symlinks.

My dotfiles are managed via [Cider](https://pypi.python.org/pypi/cider/), a
hassle-free bootstrapping python tool using Homebrew.

