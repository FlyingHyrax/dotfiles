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

Shell directives are included in install.conf.yaml that should setup the `~/backup`
directory for .vimrc, grab any submodules, and run `PlugInstall`.

I'm currently using different branchs for different system configurations.
This works alright because the setups aren't that different and I don't work
on many different computers.  That's not very scalable, so if it doesn't work
out then [rcm](https://github.com/thoughtbot/rcm) might make a nice alternative
to DotBot (requires an installation, but has more options).

**Things which aren't in here yet but probably should be:**

- OpenBox
- Sublime Text 2
- Geany
- tint2
- SSH config (?)
