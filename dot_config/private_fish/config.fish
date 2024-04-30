if status is-interactive
    fish_config theme choose lava
end
# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

zoxide init fish | source
oh-my-posh init fish --config ~/.config/omp/atomic.json | source

fish_add_path -a /Users/henek/.config/.foundry/bin
source ~/.config/fish/functions/yazi.fish
