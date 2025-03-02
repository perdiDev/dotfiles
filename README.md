# Guide for my Dotfiles
Everything is just for simple thing and i will explain for you or for me in the future

## Preinstallation
To copy this config, you need some step.

### 1. Copy this repository to your home directory or root for your profile directory, then
### 2. Install GNU Stow,
For me, because I'm using Arch Linux, btw!
```
yay -S stow
```
more information, you can get in this link (GNU Guide)[https://www.gnu.org/software/stow/manual/stow.html]

### 3. Then go to the folder your copy from this repo
Example, i copy this repo to dotfiles, so
```
cd dotfiles
```

### 4. Make symlink with stow
```
stow .
```
or, chosee the file that you want
```
stow <the-file-name>
```
### 5. Finish, you can check if there is a file symlink using ``` ls -a ````


## Installation package
### Neovim
because i'am using Arch, BTW!
```
yay -S neovim
```
