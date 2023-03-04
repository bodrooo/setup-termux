#!/bin/bash
packages=("zsh" "lsd" "git" "tree" "util-linux" "termux-api")

for package in "${packages[@]}"
do
  echo "Installing $package..."
  if ! pkg install $package -y > /dev/null 2>&1; then
    echo "Error installing $package"
  fi
done

echo "All packages installed!"


echo chsh -s $(which zsh)

cd "property"
cp -f ".zshrc" "$HOME" 
cp -f "font.ttf" "$HOME/.termux" 
cp -f "termux.properties" "$HOME/.termux"

cd

echo "\n\n Login input: zsh \n\n"
chsh
echo "\n\nPlease Restart Termux Exit And open Again"
