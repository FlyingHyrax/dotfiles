## dotfiles ##
**my personal dotfiles**

Currently unorganized, forever a work in progress...

**HowTo**

1. Clone this in home directory (duh)
2. Run `./makelinks.sh` to setup symlinks from home to ~/dotfiles
3. Boostrap Vundle: `git submodule init` | `git submodule update`
4. Install vim plugins: `PluginInstall` (in Vim)
5. Create / copy a .local file into dotfiles, exporting
    - `TODO_DIR` (path to todo.sh .txt files)
    - ...and anything else particular to that box, and it will be sourced from .bashrc

**base16 on XFCE**
xfce4-terminal technically supports 256 colors, but not without a headache.
First, check `locate xterm-256color` - if this isn't found then you need the 'ncurses-term' package
to get the correct terminal type definition.
Next the $TERM variable needs to be set to 'xterm-256color'; this is supposed to be done in
.Xresources or .Xdefaults but it looks like xfce4-terminal just ignores those, so we have to set
it explicitely in .bashrc.
At this point you should be able to `echo $TERM` and get 'xterm-256color' and
`tput colors` and get '256'.  Now that we have 256 colors to play with, we have to mix in
the base16-shell script for our variant of choice.
In vim, setting base16colorspace lets base16-vim know to look for colors in the expanded space.
You should not have to set t_Co=256, b/c vim determines that by inspecting the value of the
$TERM environment variable, and we set that up earlier.

**TODO:**
- hacks to get base16 working in terminal vim in XFCE are *not* portable.
- prevent .vim from recursively symlinking to itself when `makelinks` is run more than once.

