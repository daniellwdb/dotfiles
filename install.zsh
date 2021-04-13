#!/usr/bin/env zsh

sudo apt update && sudo apt install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common \
  git \
  make \
  tig \
  tree \
  stow

for dir in *(/); do
  [[ $dir =~ ^(vscode|windows)$ ]] && continue

  if read -q "choice?do you want to symlink $dir using stow? (y/n) "; then
    stow -v -t ~/ -S $dir
    echo " - $dir installed."
  else
    echo " - skipping $dir."
  fi
done

NEWLINE=$'\n'

if read -q "choice?${NEWLINE}do you want to install the visual studio code extensions listed below?${NEWLINE}$(cat vscode/extensions.linux)?${NEWLINE}(y/n): "; then
  echo $NEWLINE

  cat vscode/extensions.linux | while read extension || [[ -n $extension ]]; do
    code --install-extension $extension --force
  done
else
  echo " skipping."
fi
