### Various runtime config files #

**How-to:**

Uses [Dotbot](https://github.com/anishathalye/dotbot) to (hopefully) make
bootstraping new systems a breeze.  There are a few things to do first:

- You need recent versions of Git, Bash, and Python
- If you're on #!, then make sure you have replaced vim-tiny with vim
- Optionally, setup SSH keypairs so you can use the SSH clone URL below.
- ...that should be it, I think.

Then, just:

1. `git clone git@github.com:mr-seiler/dotfiles.git ~/dotfiles`
2. `cd ~/dotfiles`
3. `./install` (for bash, not fish)

Shell directives are included in install.conf.yaml that should setup the `~/backup` directory for .vimrc, grab the Vundle submodule, and run PluginInstall.

In the future, there may be different branches in this repository corresponding
to different system configurations.  This isn't a very scalable solution, but
I don't work on that many different computers.  If that doesn't hold up,
[rcm](https://github.com/thoughtbot/rcm) would make a nice alternative (requires
an installation, but has more options).

**Things which aren't in here yet but probably should be:**

- OpenBox
- Sublime Text 2
- Geany
- tint2
- SSH config (?)
