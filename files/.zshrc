###########
# Plugins #
###########

# See if zgen is installed, if not, then install it
if [ ! -d "${HOME}/.zsh/zgen" ]; then
    git clone https://github.com/tarjoilija/zgen ~/.zsh/zgen/
fi

source "${HOME}/.zsh/zgen/zgen.zsh"

if ! zgen saved; then
    echo "Creating a new zgen save"

    zgen load sharat87/zsh-vim-mode                     # Vim mode
    zgen load zsh-users/zsh-completions                 # Adds additional completions to other programs
    zgen load zsh-users/zsh-history-substring-search    # Searches through previous

    zgen save
fi

# Enable highlighting for tab completion
setopt auto_menu
setopt complete_in_word
setopt always_to_end

autoload -U compinit && compinit
zstyle ':completion:*' menu select

# Enable partial string completion
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

###########
# Options #
###########

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

############
# Software #
############

# Vagrant
export VAGRANT_HOME="${HOME}/.vagrant.d"
export VAGRANT_DOTFILE_PATH="${HOME}"

######
# OS #
######

# Handle OS specific situations
case $OSTYPE in
    msys*)
        # Windows specific commands here

        # Choco
        export PATH="$PATH:/c/ProgramData/chocolatey/bin/"

        # Chef
        export PATH="$PATH:/c/opscode/chefdk/bin/"

        # Vagrant
        export PATH="$PATH:/c/HashiCorp/Vagrant/bin/"

        # Virtualbox
        export PATH="$PATH:/c/Program Files/Oracle/VirtualBox/"
        ;;
    darwin*)
        # macOS specific commands here

        # Homebrew
        export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

        # Font
        if ! [ -f "$HOME/Library/Fonts/Inconsolata.otf" ]; then
            echo "Installing Inconsolata font"
            curl http://levien.com/type/myfonts/Inconsolata.otf > "$HOME/Library/Fonts/Inconsolata.otf"
        fi

        if [ -d "/opt/chefdk/bin" ]; then
            export PATH="/opt/chefdk/bin:$PATH"
        fi
        ;;
    linux*)
        # Linux specific commands here

        # Font
        if ! [ -f "$HOME/.fonts/Inconsolata.otf" ]; then
            # Make sure the directory exists
            if ! [ -d "$HOME/.fonts" ]; then
                mkdir ~/.fonts
            fi
            echo "Installing Inconsolata font"
            curl http://levien.com/type/myfonts/Inconsolata.otf > "$HOME/.fonts/Inconsolata.otf"
        fi
        ;;
esac

###########
# Aliases #
###########

alias ll="ls -laG --color=auto"
alias ls="ls -G --color=auto"
alias resource="source ~/.zshrc"

# Check to see if there's additional includes
if [ -d "$HOME/.includes" ]; then
    for f in $HOME/.includes/*.sh; do
        source "$f"
    done
fi

#########
# Theme #
#########

# Initialize colors.
autoload -U colors
colors

# Set the initial values
_USERNAME=$USER
_DIRECTORY=$PWD
_HOST=$HOST

# Determine username variables and colors
if [[ $EUID -eq 0 ]]; then
    _USERNAME="%{$fg_bold[red]%}%n"
    _SYMBOL="%{$fg_bold[red]%}#"
else
    _USERNAME="%{$fg_bold[cyan]%}%n"
    _SYMBOL="%{$fg_bold[cyan]%}$"
fi
_USERNAME="$_USERNAME%{$reset_color%}"
_SYMBOL="$_SYMBOL%{$reset_color%}"

# Build host string
_HOST="%{$fg_bold[magenta]%}%m%{$reset_color%}"

# Build directory string
_DIRECTORY="%{$fg_bold[blue]%}%~%{$reset_color%}"

# Build up the last command return
_RETURN="$fg_bold[grey]%?%{$reset_color%}"

# Load in VCS info
autoload -Uz vcs_info

# Set the VCS formatting
zstyle ':vcs_info:*' formats "on %{$fg_bold[green]%}%b%{$reset_color%}"

# Run the vcs_info command before the prompt updates
precmd () { vcs_info }

setopt prompt_subst

# Build prompt
PROMPT='$_USERNAME at $_HOST in $_DIRECTORY $vcs_info_msg_0_
$_SYMBOL '
