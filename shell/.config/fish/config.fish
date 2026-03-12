# Starship prompt
starship init fish | source

# Zoxide
zoxide init fish | source

# Atuin shell history
atuin init fish | source

# Direnv
direnv hook fish | source

# Aliases
alias ls 'eza --icons --group-directories-first'
alias ll 'eza -la --icons --git'
alias la 'eza -a --icons'
alias lt 'eza --tree --icons --level=2'
alias cat 'bat --style=plain'
alias du 'dust'
alias df 'duf'
alias ps 'procs'
alias top 'btop'
alias vim 'nvim'
alias vi 'nvim'
alias y 'yazi'
alias ff 'fastfetch'
alias update 'yay -Syu'
alias install 'yay -S'
alias remove 'yay -Rns'
alias search 'yay -Ss'
alias lg 'lazygit'
alias g 'git'
alias gs 'git status'
alias gc 'git commit'
alias gp 'git push'
alias gl 'git log --oneline --graph'
alias dc 'docker compose'
alias j 'just'

# Environment
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERMINAL ghostty
set -gx BROWSER brave
set -gx MANPAGER "bat --style=plain"

# Git delta as pager
set -gx GIT_PAGER delta

# Greeting
function fish_greeting
    fastfetch
end

# PATH additions
fish_add_path ~/.cargo/bin
fish_add_path ~/go/bin
fish_add_path ~/.local/bin
