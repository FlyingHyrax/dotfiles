# startup keychain to manage ssh-add and ssh-agent
eval (keychain --eval --agents ssh --quick --quiet id_rsa)