# Using the configs for local user
To use the configs for home user(s), it is recommended to symlink the required config directories/files to the respective local users' `.config` directory.

For an example, to use `waybar` config inside `$HOME` directory, you can use:
```
$ rm -rf $HOME/waybar/ && mkdir -p $HOME/waybar/

# THEN 

# Take care not to put a '/' after the directory name while symlinking
$ ln -s /etc/nixos/waybar $HOME/.config/waybar
# ^^^ Like: ln -s TARGET LINK_NAME
# Check "$ man ln" once.
```
