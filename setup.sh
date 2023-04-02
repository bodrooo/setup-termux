#!/bin/bash
clear
pkg install ncurses-utils -y > /dev/null 2>&1

path_object="$(pwd)/object"

source "$path_object/spinner.sh"

packages=('git' 'lsd' 'tree' 'python' 'nodejs-lts')

for package in "${packages[@]}"; do
	start_spinner $package
	apt install $package -y > /dev/null 2>&1
	stop_spinner $?
done

cp -rf "$path_object" $HOME
mv $HOME/object/bashrc $HOME/object/.bashrc
mv $HOME/object $HOME/.object 
mv -f $HOME/.object/.bashrc $HOME/

rm -f $HOME/../usr/etc/motd

mkdir $HOME/.termux
cd && cd .termux && start_spinner "Downloading Font" && curl -fLo font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip > /dev/null 2>&1 && stop_spinner $? && mkdir fonts && mv -f font.zip fonts && cd fonts && unzip font.zip > /dev/null 2>&1 && mv -f "Hack Regular Nerd Font Complete.ttf" .. && cd .. && mv "Hack Regular Nerd Font Complete.ttf" font.ttf && rm -rf fonts && cd

mv -f $HOME/.object/colors.properties $HOME/.termux/
node_modules_my_dev=('live-server' 'sass' 'typescript')

for node in "${node_modules_my_dev[@]}"; do
	start_spinner $node
	npm install -g $node -y > /dev/null 2>&1
	stop_spinner $?
done

rm -f $HOME/../usr/etc/motd
mv -f .object/rxfetch $HOME/../usr/etc/
mv $HOME/../usr/etc/rxfetch $HOME/../usr/etc/motd
echo "Exit and open Again, NOW!!!"

exit
exit
exit
exit


