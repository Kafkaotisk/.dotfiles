#!/bin/sh

SESSION=$(tmux list-sessions -F \#S | gum choose --header "Pick session...")
gum confirm "Commit to session?" && tmux switch-client -t "$SESSION" || tmux attach -t "$SESSION"

gum style --padding "1 5" --border double --border-foreground 212
