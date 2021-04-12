#!/usr/bin/env zsh

# Make sure GNU Stow is installed
if ! hash stow >/dev/null 2>&1; then
  echo "Command not found: stow. Aborting..."
  exit 1
fi

for dir in *(/); do
  # Exlude folders not managed by Stow
  [[ $dir =~ ^(vscode|windows)$ ]] && continue

  if read -q "choice?install $dir? (y/n): "; then
    stow -v -t ~/ -S $dir
    echo " - $dir installed."
  else
    echo " - skipping $dir."
  fi
done
