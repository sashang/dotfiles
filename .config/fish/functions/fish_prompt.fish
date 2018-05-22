function fish_prompt --description 'Write out the prompt'
	#Save the return status of the previous command
    set saved_status $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $saved_status -gt 0
        set __fish_color_status (set_color -o red)
    end
    set slash_count (echo $PWD | grep -o "/" | wc -l)
    if test $slash_count -lt 4
        set partial_pwd $PWD
    else
        set count (math $slash_count - 1)
        set partial_pwd (echo $PWD | cut -d "/" -f $count-)
    end

    switch "$USER"

        case root toor

            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'

            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
            set git_branch (git branch 2>/dev/null | grep \* |  cut -d " " -f 2)
            set git_branch_color (set_color brmagenta)
            printf '%s%s@%s %s%s %s%s%s %s(%s)%s \f\r> ' \
                "$__fish_color_blue" $USER (prompt_hostname) \
                "$__fish_prompt_cwd" "$partial_pwd" \
                "$git_branch_color" "$git_branch" "$__fish_prompt_normal" \
                "$__fish_color_status" "$saved_status" "$__fish_prompt_normal"

    end
end
