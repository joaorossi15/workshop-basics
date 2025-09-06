set -g POWERLINE_SEP '→'
set -g GM_PRIMARY  "#A50034"
set -g GM_LIGHT    "#FFFFFF"
set -g GM_ACCENT   "#F7C6C7"
set -g GM_ALT1     "#D50032"
set -g GM_ALT2     "#B22234"

function fish_prompt
  set_color --bold $GM_PRIMARY
  printf '%s ' (prompt_pwd)

  set_color --bold $GM_PRIMARY
  printf '%s ' $POWERLINE_SEP

  if git rev-parse --is-inside-work-tree &>/dev/null
    set -l branch (git symbolic-ref --short HEAD 2>/dev/null)
    set_color --bold $GM_PRIMARY
    printf 'git:%s ' $branch
    if not git diff --quiet &>/dev/null
      set_color --bold $GM_ACCENT
      printf '* '
    end
  end

  if test $status -ne 0
    set_color --bold $GM_ALT2
    printf 'status:%d ' $status
  end

  set_color normal
end

function fish_right_prompt
  set_color --bold $GM_ACCENT
  printf '%s' (date '+%H:%M')

  if set -q BATTERY_PERCENT; and test $BATTERY_PERCENT -le 100
    set -l pct $BATTERY_PERCENT
    if test $pct -gt 50
      set_color --bold $GM_LIGHT
    else if test $pct -gt 20
      set_color --bold $GM_ACCENT
    else
      set_color --bold $GM_ALT2
    end
    printf ' 🔋%d%%' $pct
  end

  set_color normal
end
