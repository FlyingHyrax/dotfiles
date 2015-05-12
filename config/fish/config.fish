# startup keychain to manage SSH keys #
# This: `eval (keychain --eval --agents ssh --quick --quiet id_rsa)`
# will set SSH_AGENT_PID and SSH_AUTH_SOCKET to garbage,
# so we have to do things a little differently:

# Don't need keychain on Mac
# if status --is-interactive
#     keychain --agents ssh --quick id_rsa
#     set kcout "$HOME/.keychain/"(uname -n)"-fish"
#     if test -e $kcout
#         source $kcout
#     end
# end

# Default todo.txt cli option
set -x TODOTXT_DEFAULT_ACTION list
