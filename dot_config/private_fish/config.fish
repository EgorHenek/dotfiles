if status is-interactive
    fish_config theme choose lava
end
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

zoxide init fish | source
oh-my-posh init fish --config ~/.config/omp/atomic.json | source
set -gx LC_ALL ru_RU.UTF-8
fish_add_path -a /Users/henek/.config/.foundry/bin
source ~/.config/fish/functions/yazi.fish
source ~/.config/fish/functions/zellij.fish
source ~/.config/fish/functions/fzf.fish

# pnpm
set -gx PNPM_HOME /Users/henek/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
