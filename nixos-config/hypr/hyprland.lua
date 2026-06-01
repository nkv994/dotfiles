-- This is an example Hyprland Lua config file.
-- Refer to the wiki for more information.
-- https://wiki.hypr.land/Configuring/Start/

-- Please note not all available settings / options are set here.
-- For a full list, see the wiki

-- You can (and should!!) split this configuration into multiple files
-- Create your files separately and then require them like this:
-- require("myColors")


------------------
---- MONITORS ----
------------------

require("hyprconf/monitors")

---------------------
---- MY PROGRAMS ----
---------------------

local programs = require("hyprconf/programs")  -- redundant if the programs are not declared in this block

-------------------
---- AUTOSTART ----
-------------------

require("hyprconf/autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("hyprconf/env_vars")

-----------------------
----- PERMISSIONS -----
-----------------------

require("hyprconf/permissions")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("hyprconf/look_and_feel")

----------------
----  MISC  ----
----------------

require("hyprconf/misc")

---------------
---- INPUT ----
---------------

require("hyprconf/input")

---------------------
---- KEYBINDINGS ----
---------------------

require("hyprconf/keybindings")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("hyprconf.windowrules")
