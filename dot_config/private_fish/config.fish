set -g theme_display_k8s_context yes
set -g theme_date_format "+%a %H:%M"
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
set -g theme_newline_cursor yes
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/henek/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
