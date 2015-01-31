# __fish_git_prompt settings
# which extras to display
set -g __fish_git_prompt_showdirtystate 1
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_showuntrackedfiles 1
set -g __fish_git_prompt_showupstream "informative"
# character settings
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix " "
set -g __fish_git_prompt_char_stagedstate "●"
#set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "…"
#set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_conflictedstate "x"
set -g __fish_git_prompt_char_cleanstate "✔"

function fish_prompt --description 'Write out the prompt'

	set -l last_status $status

	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end

	# PWD
	set_color $fish_color_cwd
	echo -n (prompt_pwd)
	set_color normal

	printf '%s ' (__fish_git_prompt)

	if not test $last_status -eq 0
	set_color $fish_color_error
	end

	echo -n '$ '

end
