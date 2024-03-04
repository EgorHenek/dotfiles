set -g theme_display_k8s_context yes
set -g theme_date_format "+%a %H:%M"
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_newline_cursor yes

if status is-interactive
    fish_config theme choose lava
    fish_vi_key_bindings on
end
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

zoxide init fish | source
