# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    PS1='${debian_chroot:+($debian_chroot)}\u:\w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    #eval "`dircolors ~/.mydircolors`"
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Force 256 color support on XFCE.  Ideally, this should be set in .Xresources,
# but xfce-terminal seems to just ignore it there, so we have to do it the gross way.
if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]
then
    if [ "$COLORTERM" == "xfce4-terminal" -o $COLORTERM == "gnome-terminal" ]
    then
        if [ -e "/lib/terminfo/x/xterm-256color" ]
        then
            export TERM=xterm-256color
        fi
    fi
fi

# now that we've forced 256 color support,
# use base16-shell to modify the 256 color space so that vim will look right
BASE16_SCHEME="monokai"
BASE16_SHELL="$HOME/.config/base16-shell/base16-${BASE16_SCHEME}.dark.sh"
if [ -x $BASE16_SHELL ]
then
    . $BASE16_SHELL
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable git bash completion and git enabled prompt
source ~/dotfiles/git-completion.bash
source ~/dotfiles/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=yes
GIT_PS1_SHOWSTASHSTATE=
GIT_PS1_SHOWUNTRACKEDFILES=yes
GIT_PS1_SHOWUPSTREAM=
PROMPT_COMMAND='__git_ps1 "\n\u@\h:\w" "\\[\n\$ "'

# for todo.sh https://github.com/ginatrapani/todo.txt-cli/wiki/Quick-Start-Guide
export TODOTXT_DEFAULT_ACTION=ls
if [ -f ~/bin/todo_completion ]
then
    source ~/bin/todo_completion
    complete -F _todo todo
fi

# either private or local to this machine:
if [ -f ~/dotfiles/.local ]
then
    source ~/dotfiles/.local
fi

# not totally sure what this does, I *believe* it's for gnat?
export LIBRARY_PATH="/usr/lib/x86_64-linux-gnu"

# android is at:
export ANDROID_SDK="$HOME/bin/android"

# PATH additions
PATH=$PATH:"/usr/local/gnat/bin/" #gnat (ada)
PATH=$PATH:"/usr/local/go/bin/" #golang
PATH=$PATH:"$ANDROID_SDK/tools":"$ANDROID_SDK/platform-tools" #android
PATH=$PATH:"$HOME/.rvm/bin" # Add RVM to PATH for scripting
PATH=$PATH:"./"
