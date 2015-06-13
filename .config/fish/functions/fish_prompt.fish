function fish_prompt
    set branch " "
    if git branch > /dev/null ^ /dev/null
        set branch :(git branch ^ /dev/null | grep \* |  cut -d " " -f 2)
    end
    set hostname (hostname)
    echo "$USER@$hostname$branch> "
end
