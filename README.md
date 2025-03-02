# Guide for my Dotfiles
Everything is just for simple things and I will explain for you or for me in the future.

## Preinstallation
To copy this config, you need to follow these steps:

### 1. Copy this repository to your home directory
Copy this repository to your home directory or root for your profile directory.

### 2. Install GNU Stow
For me, because I'm using Arch Linux, btw!
```bash
yay -S stow
```
For more information, you can check the [GNU Stow Guide](https://www.gnu.org/software/stow/manual/stow.html)

### 3. Navigate to the copied repository
Example, if I copy this repo to a folder called 'dotfiles':
```bash
cd dotfiles
```

### 4. Make symlinks with stow
To stow everything:
```bash
stow .
```
Or, choose only specific files/directories:
```bash
stow <the-file-name>
```

### 5. Finish
You can check if there are symlinked files using:
```bash
ls -la ~
```

## Installation of required packages

### Neovim
Because I'm using Arch, BTW!
```bash
yay -S neovim
```

### Ghostty Terminal
```bash
yay -S ghostty
```
