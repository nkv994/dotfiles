{ config, pkgs, ... }:
{
    home.username = "nikhil";
    home.homeDirectory = "/home/nikhil";
    home.stateVersion = "25.11";

    programs.bash = {
        enable = true;
        shellAliases = {
            btw = "echo I use NixOS, btw.";
        };
        profileExtra = ''
            if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
                exec uwsm start -S hyprland-uwsm.desktop
            fi
        '';
    };

    programs.git = {
        enable = true;

        extraConfig = {
            safe.directory = "/etc/nixos";
        };
    };

# Commenting in order to remove the previous symlink for Hyprland config.
#     wayland.windowManager.hyprland = {
#         enable = true;
#         settings = {
#             "$mod" = "SUPER";
# 
#             monitor = ",preferred,auto,1";  # auto-detect monitor
# 
#             exec-once = [
#                 "waybar"
#                 "dunst"
#                 "hyprpaper"
#                 "/run/current-system/sw/libexec/polkit-gnome-authentication-agent-1"
#             ];
# 
#             general = {
#                 gaps_in = 5;
#                 gaps_out = 10;
#                 border_size = 2;
#                 layout = "dwindle";
#             };
# 
#             decoration = {
#                 rounding = 8;
#                 blur = {
#                     enabled = true;
#                     size = 8;
#                     passes = 2;
#                 };
#             };
# 
#             animations.enabled = true;
# 
#             input = {
#                 kb_layout = "us";
#                 follow_mouse = 1;
#                 touchpad.natural_scroll = true;
#             };
# 
#             bind = [
#                 "$mod, Return, exec, kitty"
#                 "$mod, Q, killactive"
#                 "$mod, M, exit"
#                 "$mod, Space, exec, wofi --show drun"
#                 "$mod, F, fullscreen"
#                 "$mod, left, movefocus, l"
#                 "$mod, right, movefocus, r"
#                 "$mod, up, movefocus, u"
#                 "$mod, down, movefocus, d"
#                 # Workspaces
#                 "$mod, 1, workspace, 1"
#                 "$mod, 2, workspace, 2"
#                 "$mod, SHIFT, 1, movetoworkspace, 1"
#                 "$mod, SHIFT, 2, movetoworkspace, 2"
#             ];
# 
#             bindm = [
#                 "$mod, mouse:272, movewindow"
#                 "$mod, mouse:273, resizewindow"
#             ];
# 
#             windowrulev2 = [
#                 "supressevent,maximize,class:.*"
#             ];
#         };
#     };

    home.packages = with pkgs; [
        onedriver  # Refer github:jstaf/onedriver
    ];
}
