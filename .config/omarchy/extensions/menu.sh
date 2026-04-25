# Overwrite parts of the omarchy-menu with user-specific submenus.
# See $OMARCHY_PATH/bin/omarchy-menu for functions that can be overwritten.
#
# WARNING: Overwritten functions will obviously not be updated when Omarchy changes.
#
# Example of minimal system menu:
#
# show_system_menu() {
#   case $(menu "System" "  Lock\n󰐥  Shutdown") in
#   *Lock*) omarchy-lock-screen ;;
#   *Shutdown*) omarchy-cmd-shutdown ;;
#   *) back_to show_main_menu ;;
#   esac
# }
#
#
#
show_system_menu() {
	local options="󱄄  Screensaver\n  Lock"
	[[ ! -f ~/.local/state/omarchy/toggles/suspend-off ]] && options="$options\n󰒲  Suspend"
	omarchy-hibernation-available && options="$options\n󰤁  Hibernate"
	options="$options\n󰍃  Logout\n󰜉  Restart\n󰐥  Shutdown"

	case $(menu "System" "$options") in
	*Screensaver*) omarchy-launch-screensaver force ;;
	*Lock*) omarchy-lock-screen ;;
	*Suspend*) systemctl suspend ;;
	*Hibernate*) systemctl hibernate ;;
	*Logout*) omarchy-system-logout ;;
	*Restart*) omarchy-system-reboot ;;
	*Shutdown*) omarchy-system-shutdown ;;
	*) back_to show_main_menu ;;
	esac
}

show_setup_config_menu() {
	case $(menu "Setup" "  Defaults\n  Hyprland\n  Hypridle\n  Hyprlock\n  Hyprsunset\n  Swayosd\n󰌧  Walker\n󰍜  Waybar\n󰞅  XCompose\n  Input\n󰮫  Menu\n󰊠  Ghostty\n  Nvim\n  Tmux\n󰇥  Yazi") in
	*Defaults*) open_in_editor ~/.config/uwsm/default ;;
	*Hyprland*) open_in_editor ~/.config/hypr/hyprland.conf ;;
	*Hypridle*) open_in_editor ~/.config/hypr/hypridle.conf && omarchy-restart-hypridle ;;
	*Hyprlock*) open_in_editor ~/.config/hypr/hyprlock.conf ;;
	*Hyprsunset*) open_in_editor ~/.config/hypr/hyprsunset.conf && omarchy-restart-hyprsunset ;;
	*Swayosd*) open_in_editor ~/.config/swayosd/config.toml && omarchy-restart-swayosd ;;
	*Walker*) open_in_editor ~/.config/walker/config.toml && omarchy-restart-walker ;;
	*Waybar*) open_in_editor ~/.config/waybar/config.jsonc && omarchy-restart-waybar ;;
	*XCompose*) open_in_editor ~/.XCompose && omarchy-restart-xcompose ;;
	*Input*) open_in_editor ~/.config/hypr/input.conf ;;
	*Menu*) open_in_editor ~/.config/omarchy/extensions/menu.sh ;;
	*Ghostty*) open_in_editor ~/.config/ghostty/config ;;
	*Nvim*) open_in_editor ~/.config/nvim/lua/config/ ;;
	*Tmux*) open_in_editor ~/.config/tmux/tmux.conf ;;
	*Yazi*) open_in_editor ~/.config/yazi/yazi.toml ;;
	*) show_setup_menu ;;
	esac
}
