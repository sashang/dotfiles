function fish_prompt --description 'Write out the prompt'
	#Save the return status of the previous command
    set radioactive \u2622
    set skull \u2620
    set smiley \u263A
    set saved_status $status
    set status_indicator $smiley
    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    set -g __fish_color_yellow (set_color -o yellow)
    set -g __fish_color_green (set_color -o green)
    set -g __fish_color_red (set_color -o red)
    set -g __fish_color_purple (set_color -o purple)

    #Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $saved_status -gt 0
        set __fish_color_status (set_color -o -r red)
        set status_indicator "$saved_status$skull "
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
            if git branch > /dev/null 2>&1
                set -g __fish_git_prompt_show_informative_status
                printf '%s%s %s%s %s%s %s%s%s > ' \
                    "$__fish_color_blue" $USER \
                    "$__fish_color_green" "$partial_pwd" \
                    "$__fish_color_purple" (fish_git_prompt) \
                    "$__fish_color_status" "$status_indicator" "$__fish_prompt_normal"
            else
                printf '%s%s@%s %s%s %s%s%s > ' \
                    "$__fish_color_blue" $USER (prompt_hostname) \
                    "$__fish_prompt_cwd" "$partial_pwd" \
                    "$__fish_color_status" "$status_indicator" "$__fish_prompt_normal"
            end

    end
end
