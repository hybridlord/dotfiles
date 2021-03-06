#!/bin/bash
### Vars
dir=~/dotfiles
olddir=~/dotfiles_old
files="zshrc tmux.conf aliases gitconfig conkyrc"

### Create dotfiles_old in homedire
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

### Change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

### Move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlinks to $file in home directory"
    ln -s $dir/$file ~/.$file
done

