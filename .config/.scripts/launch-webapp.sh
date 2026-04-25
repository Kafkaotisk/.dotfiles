#!/bin/bash
# Launch the passed in URL as a web app in the default browser (or chromium if the default doesn't support --app).

# Redirect standard WebApp calls to librewolf WebApp profile
browser=$(xdg-settings get default-web-browser)

case $browser in
librewolf*)
	# Launch librewolf directly with the dedicated WebApp profile
	exec setsid uwsm app -- librewolf --no-remote -P "WebApps" --new-window --class WebApp "$1" "${@:2}"
	;;
*)
	# Old Chromium fallback for other browsers if needed
	browser="chromium.desktop"
	exec setsid uwsm app -- $(sed -n 's/^Exec=\([^ ]*\).*/\1/p' {~/.local,~/.nix-profile,/usr}/share/applications/$browser 2>/dev/null | head -1) --app="$1" "${@:2}"
	;;
esac
