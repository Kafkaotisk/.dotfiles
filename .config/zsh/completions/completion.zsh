
#  ╔═══════════════════════════════════════════════════════════════════════════╗
#  ║     ____ ___  __  __ ____  _     _____ _____ ___ ___  _   _               ║
#  ║    / ___/ _ \|  \/  |  _ \| |   | ____|_   _|_ _/ _ \| \ | |              ║
#  ║   | |  | | | | |\/| | |_) | |   |  _|   | |  | | | | |  \| |              ║
#  ║   | |__| |_| | |  | |  __/| |___| |___  | |  | | |_| | |\  |              ║
#  ║    \____\___/|_|  |_|_|   |_____|_____| |_| |___\___/|_| \_|              ║
#  ║                                                                           ║
#  ╚═══════════════════════════════════════════════════════════════════════════╝

#  ┌───────────────────────────────────────────────────────────────────────────┐
#  │ General                                                                   │
#  └───────────────────────────────────────────────────────────────────────────┘

# Allow you to select in a menu
# If not fzf-tab
#zstyle ':completion:*' menu select
# Use hjlk in menu selection (during completion)
# Doesn't work well with interactive mode
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'l' vi-forward-char

#bindkey -M menuselect '^xg' clear-screen
#bindkey -M menuselect '^xi' vi-insert                      # Insert
#bindkey -M menuselect '^xh' accept-and-hold                # Hold
#bindkey -M menuselect '^xn' accept-and-infer-next-history  # Next
#bindkey -M menuselect '^xu' undo                           # Undo

autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

#  ┌───────────────────────────────────────────────────────────────────────────┐
#  │ Options                                                                   │
#  └───────────────────────────────────────────────────────────────────────────┘

# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.

setopt ALWAYS_TO_END        # Move cursor to end after completion
setopt MENU_COMPLETE        # Insert first match on ambiguous completions. Overrides AUTO_MENU.
setopt AUTO_MENU            # Show completion menu on tab
#  ┌───────────────────────────────────────────────────────────────────────────┐
#  │ zstyles                                                                   │
#  └───────────────────────────────────────────────────────────────────────────┘
# Ztyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
# Complete the alias when _expand_alias is used as a function
zstyle ':completion:*' complete true

#  ┌─────────────┐
#  │ fzf-tab     │
#  └─────────────┘
# fzf-tab plugin configuration - add previews to tab completion
zstyle ':fzf-tab:complete:ls:*' fzf-preview 'if [ -d $realpath ]; then ls -la --color=always $realpath; elif [ -f $realpath ]; then bat -n --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath; fi'
zstyle ':fzf-tab:complete:cat:*' fzf-preview 'bat -n --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath'
zstyle ':fzf-tab:completeH:bat:*' fzf-preview 'bat -n --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath'
zstyle ':fzf-tab:complete:vim:*' fzf-preview 'bat -n --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat -n --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath'
zstyle ':fzf-tab:complete:nano:*' fzf-preview 'bat -n --color=always --line-range :500 $realpath 2>/dev/null || cat $realpath'
zstyle ':fzf-tab:complete:*:*' fzf-preview 'if [ -d $realpath ]; then ls -la --color=always $realpath; elif [ -f $realpath ]; then bat -n --color=always --line-range :100 $realpath 2>/dev/null || cat $realpath; fi'
zstyle ':fzf-tab:*' fzf-flags --height=60% --preview-window=right:60%:wrap
zstyle ':fzf-tab:*' switch-group ',' '.'

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup


# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'




