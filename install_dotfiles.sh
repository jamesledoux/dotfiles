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

if [[ ! -f "$HOME/.ssh/id_rsa.pub" ]]; then
    echo "SSH key doesn't exist; make ssh keygen"
    ssh-keygen -t rsa -b 4096
    echo "Remember to run 'ssh-copy-id <ssh-server>' to all servers to add this key"
fi

if [[ ! $(sudo grep NOPASSWD /etc/sudoers) ]]; then
    echo "$USER ALL=NOPASSWD:ALL" | sudo tee /etc/sudoers
fi

echo "APT package installation"
if [[ ! -f "$HOME/.installed_dotfiles" ]] ; then
    touch "$HOME/.installed_dotfiles"
    sudo apt update
    sudo apt upgrade -y
    sudo apt -y install build-essential tree screen exuberant-ctags vim
    sudo apt -y install vim-python-jedi python-jedi
    vim-addons install python-jedi
    sudo apt -y install mlocate net-tools dnsutils
fi

cd $HOME
if [[ ! -f "$HOME/venv" ]]; then
    deactivate
    echo "Creating python2 venv"
    pip install virtualenv
    pip install wheel
    $HOME/.local/bin/virtualenv -p /usr/bin/python2.7 venv
    . $HOME/venv/bin/activate
    pip install -r $DOT_BASE/venv/requirements.txt
fi
cd $HOME
if [[ ! -f "$HOME/venv3" ]]; then
    deactivate
    echo "Creating python3 venv3"
    python3 -m venv $HOME/venv3
    pip3 install wheel
    . $HOME/venv3/bin/activate
    pip3 install -r $DOT_BASE/venv3/requirements.txt
fi
