#!/bin/bash

echo "Creating Directories"
DOT_BASE="$HOME/dotfiles"
DOT_HOME="$HOME/dotfiles/home"
for dir in `find $DOT_HOME -type d`; do
    new_path="${dir/$DOT_HOME/$HOME}"
    if [[ ! -d "$new_path" ]]; then
        mkdir -p "$new_path" 
    fi
done

echo "Symlink dotfiles"
# Symlink dotfiles
for f in `find $DOT_HOME -type f ! -name '*.sw*' ! -name '*.pyc'`; do
    new_file="${f/$DOT_HOME/$HOME}"
    if [[ -f "$new_file" && ! -L "$new_file" ]]; then
        mv "$new_file" "$new_file.original"
    fi
    if [[ ! -f "$new_file" && ! -L "$new_file" ]]; then
       # echo "ln -s $CWD/${f:2} $HOME/${f:2}"
	ln -s "$f" "$new_file"
    fi
done

if [[ ! -f ".vim/bundle/YouCompleteMe" ]]; then
   ln -s "$DOT_BASE/YouCompleteMe" "$HOME/.vim/bundle/YouCompleteMe"
   cd $HOME/.vim/bundle/YouCompleteMe/
   git submodule update --init --recursive
   python3 install.py
fi
cd $DOT_HOME
cd ..

if [[ ! -f "$HOME/.ssh/id_rsa.pub" ]]; then
    echo "SSH key doesn't exist; make ssh keygen"
    ssh-keygen -t rsa -b 4096
    echo "Remeber to run 'ssh-copy-id <ssh-server>'"
fi

if [[ ! $(sudo grep NOPASSWD /etc/sudoers) ]]; then
    echo "$USER ALL=NOPASSWD:ALL" | sudo tee /etc/sudoers
fi
echo "APT package installation"

sudo apt update
sudo apt upgrade -y
sudo apt -y install build-essential tree screen exuberant-ctags vim


