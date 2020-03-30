#!/bin/bash

#NOTE: If you are planning on using this be sure to edit all the file paths
#      to reflect your local system setup. Also, this script REMOVES ALL of
#      of your local system files prior to creating the symlinks. Please be
#      sure to backup your local versions prior to running it.

##################################################
# Installs all Packages 
##################################################

echo "Updating system"
sudo pacman -Syu

echo "Installing all official packages"
sudo pacman -S --needed -< ./packages/pkg-list-official.txt

echo "Installing yay (yet another yogurt) to install all aur"
git clone https://aur.archlinux.org/yay.git/
cd yay
makepkg -sri
cd ..

echo "Installing all unofficial packages"
yay -S --needed -< ./packages/pkg-list-aur.txt

##################################################
# Vim Setup
##################################################

# Set up the symlinks for .vimrc and .vim
echo "Symlinking vim configuration files and directories"

rm ~/.vimrc > /dev/null
rm -r ~/.vim > /dev/null

ln -sv ~/Projects/JCD-Setup/vim/.vimrc ~/
ln -sv ~/Projects/JCD-Setup/vim/.vim ~/

# Install all of the vim plugins

cd ./vim/.vim/bundle/
chmod +x plugin-installer.sh
./plugin-installer.sh
cd ../../../


##################################################
# Bash Setup
##################################################

echo "Symlinking bashrc"

rm ~/.bashrc > /dev/null
ln -sv ~/Projects/JCD-Setup/bash/.bashrc ~/

##################################################
# Dot Files Setup
##################################################

#Rather than linking the whole .config we want to maintain the current .config
#and only update it with the folders and files in the global .config

for f in "./config/*"
do
  f=$(basename "$f")
  rm -r ~/.config/$f
  ln -sv ~/Projects/JCD-Setup/config/$f ~/.config/

done



