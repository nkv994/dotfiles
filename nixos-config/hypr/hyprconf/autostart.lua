
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

 local programs = require("hyprconf/programs")
 -- ^^^ Since the calling block is located at ~/.config/hypr/ (in the file hyprland.lua)

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
 hl.on("hyprland.start", function () 
   --hl.exec_cmd(programs.terminal)
   hl.exec_cmd("nm-applet")
   hl.exec_cmd("hyprpaper & hypridle & waybar")
   hl.exec_cmd("hyprctl reload")
 end)

