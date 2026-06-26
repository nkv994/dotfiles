## Cloning and pulling changes from this repo

Suppose you (plan to) keep git-clones at `~/Documents/git-repo` directory in your system. Run the following commands in sequence:
```bash
mkdir -p ~/Documents/git-repo/  # If the directory already exists, ignore.
cd ~/Documents/git-repo/        
git clone https://www.github.com/nkv994/dotfiles.git dotfiles-nikhil  # This creates a clone of this GitHub repository
```
Now for pulling changes into the repo to your system, simply run:
```bash
cd ~/Documents/git-repo/dotfiles-nikhil/
git pull
```

## Using the config files

### Example: Starship
Suppose the Starship config files lie in `~/.config/starship/` directory in your system.  
Then, rename the directory as:
```bash
mv ~/.config/starship/ ~/.config/starship.backup/
```
And then create a symlink targetting at the config file in the Git directory in your system:
```bash
ln -s ~/Documents/git-repo/dotfiles-nikhil/starship ~/.config/starship
```

### Example: `.bashrc`
```bash
mv ~/.bashrc ~/.bashrc.backup
ln -s ~/Documents/git-repo/dotfiles-nikhil/.bashrc ~/.bashrc
```

### Verify
#### For Starship:
```bash
ls -l ~/config/starship  # or alternatively use readlink
```
Expected typical output:
```bash
$HOME/.config/starship -> $HOME/Documents/git-repo/dotfiles-nikhil/starship
```
#### For `.bashrc`:
```bash
readlink ~/.bashrc
```
Expected output:
```bash
$HOME/Documents/git-repo/dotfiles-nikhil/.bashrc
```

## Optional
Only if all the commands are run successfully:
```bash
rm -rf ~/.config/starship.backup/
```
and/or:
```bash
rm ~/.bashrc.backup
```
etc.

> **Note**
>
> Do **not** add a trailing `/` to the target directory when creating the symlink.
>
> ```bash
> ln -s TARGET LINK_NAME
> ```
>
> See `man ln` for details.

