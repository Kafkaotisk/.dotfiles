#!/bin/bash

project_emoji=""
template_emoji=""
directory_emoji=""

list=$(
	moxide list \
		--format-project "$project_emoji {}" \
		--format-template "$template_emoji {}" \
		--format-directory "$directory_emoji {}"
)

value=$(
	echo "$list" |
		fzf \
			--no-sort \
			--layout reverse \
			--border rounded \
			--border-label "Moxide Sessions" \
			--no-scrollbar \
			--prompt " " \
			--pointer "" \
			--color=bg+:#2d353b,bg:#2E383C,spinner:#d3c6aa,hl:#f38ba8 \
			--color=fg:#d3c6aa,header:#d3c6aa,info:#d3c6aa,pointer:#d3c6aa \
			--color=marker:#b4befe,fg+:#d3c6aa,prompt:#d3c6aa,hl+:#f38ba8 \
			--color=selected-bg:#45475a
)

IFS=' ' read -r emoji name <<<"$value"
case "$emoji" in
$project_emoji)
	moxide project start "$name"
	;;
$template_emoji)
	moxide template start "$name"
	;;
$directory_emoji)
	moxide dir start "$name"
	;;
esac
