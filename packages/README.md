# Packages

This directory contatins a list of all packages that I find personally useful or nessacary for my day to day activities.

# ./pkg-list-official.txt
This is a list of all packages installed on my current system. This list was generated via use of the following command:
```
pacman -Qent | awk `{ print $1 }` > pkg-list-official.txt
```
then, to install, run the following command on the package list that was generated to install the packages therein:
```
sudo pacman -S -needed -< pkg-list-official.txt
```
