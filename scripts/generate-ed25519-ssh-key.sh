#!/usr/bin/env sh

ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/id_ed25519
ssh-add -K ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
echo "~/.ssh/id_ed25519.pub copied to clipboard."
