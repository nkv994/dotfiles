## Using the configs for local users

To use the configurations for a local user, symlink the required files or directories into the user's `~/.config` directory.

### Example: Waybar

```bash
rm -rf ~/.config/waybar
mkdir -p ~/.config

# Create the symlink
ln -s /etc/nixos/waybar ~/.config/waybar
```

### Verify

```bash
ls -l ~/.config/waybar
```

Expected output:

```text
waybar -> /etc/nixos/waybar
```

> **Note**
>
> Do **not** add a trailing `/` to the target directory when creating the symlink.
>
> ```bash
> ln -s TARGET LINK_NAME
> ```
>
> See `man ln` for details.
