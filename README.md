# Brendan dotfiles

```bash
curl -fsSL https://raw.githubusercontent.com/brendanfalk/dotfiles/main/install.sh
```

## Todos

- [ ] Create a `--server` option for install.sh which only installs CLIs not casks or macos apps
- [ ] Create a `--work` option for install.sh which only install casks relevant for work
- [ ] Work out why iterm2 credentials arent'y syncing with mackup

## Mackup

I use [Mackup](https://github.com/lra/mackup) to manage symlinking my configuration files

### `mackup backup`

Moves all configuration files to `~/proj/dotfiles/Mackup` then symlinks them to their original location e.g.

```
cp ~/.gitconfig ~/proj/dotfiles/Mackup/.gitconfig
rm ~/.gitconfig
ln -s ~/proj/dotfiles/Mackup/.gitconfig ~/.gitconfig
```

### `mackup restore`

Symlinks all files from `~/proj/dotfiles/Mackup` to their correct location

```
ln -s ~/proj/dotfiles/Mackup/.gitconfig ~/.gitconfig
```

### `mackup uninstall`

Reverses the process of `mackup backup` ie deletes the symlinked files and then moves the files from `~/proj/dotfiles/Mackup` to their correct location

### Error handling

Messing up symlinking can result in data loss.

1. Run `mackup uninstall` on all computers
2. Copy your Mackup files to the new storage location
3. Change the storage provider details in your .mackup.cfg file (see above)
4. Run `mackup backup` on the main computer and `mackup restore` on all others

https://github.com/lra/mackup/tree/master/doc#switching-storage

Known errors

- https://github.com/lra/mackup/pull/1949/files
