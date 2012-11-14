# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="gefilte"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails3 gem ssh-agent zsh-syntax-highlighting bundler gem rvm git-flow encode64 nyan)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/home/yonkeltron/bin:/home/yonkeltron/bin:/home/yonkeltron/node_modules/.bin:/usr/local/bin:/usr/bin:/bin:/usr/games

#alias ss='ruby script/server thin'
#alias sd='ruby script/server thin --debugger'

alias gl='git pull --rebase -p'

stty stop undef
setopt NO_FLOW_CONTROL
setopt magicequalsubst
setopt interactivecomments

autoload -U zrecompile

alias present="impressive -T 500 -c disk --cachefile cache.cache --supersample -t Crossfade"

#editor stuff
export EDITOR="/usr/bin/emacsclient -t"
export VISUAL="/usr/bin/emacsclient -c"

# Ruby Tuning
export RUBY_HEAP_MIN_SLOTS=500000
export RUBY_HEAP_SLOTS_INCREMENT=500000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=500000000
export RUBY_HEAP_FREE_MIN=500000
export RUBY_FREE_MIN=$RUBY_HEAP_FREE_MIN

# JRuby
export JRUBY_OPTS="--1.9"

# "\s" => "_" for all filenames in the given paths
unspacify() {
    zparseopts -D -E -A arguments -- r h v

    if [[ ${+arguments[-h]} -gt 0 || "$#@" -eq 0 ]]; then
        echo "Usage: \`$0' [OPTIONS] PATHS"
        echo "-h\t show this help"
        echo "-r\t recurse through given paths"
        echo "-v\t verbose"
        echo
        echo "Remove spaces from filenames and replace them with underscores!"
    else
        # is it there's more than one path provided
        if [[ "$#@" -gt 0 ]]; then
            # loop through each path
            for dir_path in "$@"; do
                if [[ -f $dir_path ]]; then
                    if [[ ${+arguments[-v]} -gt 0 ]]; then
                        echo 'mv $dir_path ${dir_path/ /_}'
                    fi
                    mv $dir_path ${dir_path/ /_}
                elif [[ ! -d $dir_path ]]; then
                    echo "problem: No such path '$dir_path'"
                else
                    # if not recursive
                    if [[ ${+arguments[-r]} -eq 0 ]]; then
                        target_path="${dir_path}/* *"
                    fi

                    # if recursive
                    if [[ ${+arguments[-r]} -gt 0 ]]; then
                        target_path="${dir_path}/**/* *"
                    fi

                    # if verbose
                    if [[ ${+arguments[-v]} -gt 0 ]]; then
                        move_command="${target_path} $f:gs/ /_"
                        echo "zmv ${move_command}"
                    fi

                    zmv $target_path '$f:gs/ /_'
                fi
            done
        fi
    fi
}

if [[ -s /home/yonkeltron/.rvm/scripts/rvm ]] ; then source /home/yonkeltron/.rvm/scripts/rvm ; fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
