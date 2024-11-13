dotfiles
========
Your dotfiles are how you personalize your system. These are mine.
My dotfiles are managed via [Dotbot](https://github.com/anishathalye/dotbot), a tool that bootstraps your dotfiles.

Setup
--------
_Prerequisites: git, python, zsh_
Simply clone this repository and run the `install` script. These steps depend on Git and Python being available.
This script is _idempotent_, and can be safely invoked again to update tools and ensure everything has been installed
correctly.

Curious about my setup?
-----------------------
My system is reliant upon the [Mac App Store](https://www.apple.com/osx/apps/app-store/), [Homebrew](http://brew.sh), 
and [oh-my-zsh](http://ohmyz.sh).

After reviewing many different public dotfile systems, frameworks, and dotfile utilities such as those summarized on
the [unofficial guide to dotfiles on GitHub](https://dotfiles.github.io), I discovered the simplicity offered by a
single tool called [Cider](https://github.com/msanders/cider) that saves and restores your `Homebrew` and `Homebrew
Cask` setup as well as saving and restoring `~` symlinks.

Over time, `Homebrew` has incorporated many of `Cider`'s advertised features that I chose it for. Specifically,
`Homebrew` has integrated `Homebrew Cask` into its built-in functionality and introduced `Brewfile` support. The developer of
`Cider` has superseded it with a new tool that is more specialized for macOS programmed in Swift,
[zero.sh](https://github.com/zero-sh/zero.sh). This led me to experiment with other dotfile managers which provide
broader, more versatile features for managing configurations that are also platform-agnostic.

I settled on `Dotbot` and forked the
[Dotbot dotfiles_template](https://github.com/anishathalye/dotfiles_template/generate).
