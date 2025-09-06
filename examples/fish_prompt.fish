function fish_prompt
    set -l last_status $status

    set_color brgreen
    echo -n (whoami) "@" (hostname -s) " "

    set_color brblue
    echo -n (prompt_pwd) " "

    set_color brmagenta
    if type -q git
        set branch (git symbolic-ref --short HEAD ^/dev/null)
        if test -n "$branch"
            echo -n "🌱 $branch "
        end
    end

    if test $last_status -ne 0
        set_color brred
        echo -n "✗ "
    end

    set_color normal
    echo -n "❯ "
end
