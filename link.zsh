#!/usr/bin/env zsh

echo "Making symlinks for dotfiles in $HOME at $(date)"

function {
    dotfiles=(irbrc tmux.conf zshrc);

    for dotfilepath in $dotfiles; do
        local fullpath="$HOME/.$dotfilepath"
        if [[ -r $fullpath ]]; then
            echo "It looks like $fullpath already exists. Moving it to $fullpath.old."
            mv $fullpath $fullpath.old
        fi

        echo "Linking .$dotfilepath in $HOME"
        ln -s $PWD/$dotfilepath $fullpath
    done
}

echo "Checking emacs config"
function {
    # check if the directory exists
    if [[ -d $HOME/.emacs.d ]]; then
        echo "It looks like your .emacs.d directory already exists. Good."
    else
        echo "Creating your .emacs.d directory."
        mkdir $HOME/.emacs.d
    fi

    # deal with file
    local init_file=$HOME/.emacs.d/init.el;

    if [[ -w $init_file ]]; then
        echo "It looks like $init_file already exists. Moving it to $init_file.old."
        mv $init_file $init_file.old
    fi

    # do the copy
    echo "Linking .$dotfilepath in $HOME/.emacs.d"
    ln -s $PWD/init.el $init_file
}

echo "Symlinking completed at $(date)"
