# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load zsh options, keybindings, and completion
[[ -f /usr/share/omarchy-zsh/shell/zoptions ]] && source /usr/share/omarchy-zsh/shell/zoptions

# Load shared shell configuration (aliases, functions, environment, tool init)
[[ -f /usr/share/omarchy-zsh/shell/all ]] && source /usr/share/omarchy-zsh/shell/all

# Add your own customizations below

#############
## HISTORY ##
#############
HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

################
## Navigation ##
################
setopt AUTOCD               # Change dir given just path.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt extendedglob         # Use additional pattern matching features.
setopt nomatch              # Unmatched patterns cause an error.

setopt CHASE_LINKS          # Mark symlinked directories

setopt NOTIFY               # Immediately report changes in background job status.
unsetopt BEEP               # Beep on errors.
unsetopt MULTIBYTE

# +---------+
# | ALIASES |
# +---------+
source $ZDOTDIR/.aliases

#  ┌──────────────────────────┐
#  │ EXECUTE ON START         │
#  └──────────────────────────┘
fastfetch

echo "Welcome"
echo ""
echo "    ███          ▄█    ▄████████    ▄████████    ▄████████ ";
echo "▀█████████▄     ███   ███    ███   ███    ███   ███    ███ ";
echo "   ▀███▀▀██     ███   ███    ███   ███    █▀    ███    █▀  ";
echo "    ███   ▀     ███   ███    ███  ▄███▄▄▄       ███        ";
echo "    ███         ███ ▀███████████ ▀▀███▀▀▀     ▀███████████ ";
echo "    ███         ███   ███    ███   ███                 ███ ";
echo "    ███         ███   ███    ███   ███           ▄█    ███ ";
echo "   ▄████▀   █▄ ▄███   ███    █▀    ███         ▄████████▀  ";
echo "            ▀▀▀▀▀▀                                         ";
echo ""
# +------------+
# | COMPLETION |
# +------------+
source $ZDOTDIR/completions/completion.zsh

###############
### Plugins ##
##############
source /usr/share/zsh-antidote/antidote.zsh
antidote load $ZDOTDIR/.zsh_plugins.txt

# fzf
#source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

GPG_TTY=$(tty)
export GPG_TTY

