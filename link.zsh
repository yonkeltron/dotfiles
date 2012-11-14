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

echo "Symlinking completed at $(date)"
