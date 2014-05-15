## dotfiles ##
**my personal dotfiles**  
Currently unorganized, forever a work in progress...

**HowTo**

1. Clone this in home directory (duh)
2. Run `./makelinks.sh` to setup symlinks from home to ~/dotfiles
3. Boostrap Vundle: `git submodule init` | `git submodule update`
4. Install vim plugins: `PluginInstall` (in Vim)
5. Create / copy a .local file into dotfiles, exporting:
    - `GIT_USER_NAME`
    - `GIT_USER_EMAIL`
    - `GITHIB_USER`
    - `TODO_DIR`
    - ...etc.

**TODO:**
- prevent .vim from recursively symlinking to itself when makelinks is run more than once
- fancy git-enabled bash prompt
- snippets?

