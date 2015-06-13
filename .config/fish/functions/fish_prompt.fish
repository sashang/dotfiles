function fish_prompt
    set err $status
    if git branch > /dev/null ^ /dev/null
        set branch (git branch ^ /dev/null | grep \* |  cut -d " " -f 2)
    end
    if test $err = 0
        printf '%s@%s %s%s %s%s %s> ' (whoami) (hostname|cut -d . -f 1) \
            (set_color $fish_color_cwd) (prompt_pwd) (set_color purple) \
            $branch (set_color normal)
    else
        printf '%s@%s %s%s %s%s %s%s %s> ' (whoami) (hostname|cut -d . -f 1) \
            (set_color $fish_color_cwd) (prompt_pwd) (set_color purple) $branch \
            (set_color red) $err (set_color normal)
    end

end
