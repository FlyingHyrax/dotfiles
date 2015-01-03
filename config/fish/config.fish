# startup keychain to manage ssh-add and ssh-agent
eval (keychain --eval --agents ssh --quick --quiet id_rsa)

# Default todo.txt cli option
set -x TODOTXT_DEFAULT_ACTION list
