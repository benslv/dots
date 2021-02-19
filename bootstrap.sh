#!/usr/bin/env bash

# 1. Install Git and create a new SSH key for the machine.
echo "Installing git and creating a new SSH key for this machine...\n"

sudo pacman -S openssh git
ssh-keygen -t ed25519 -C "bensilverman10@gmail.com"

echo "\nAdd this public key to your GitHub before continuing.\n"
cat ~/.ssh/id_ed25519.pub
echo "Press <enter> when ready to continue..."

# 2. Pull full dotfiles from GitHub.
echo "2. Retrieving your dotfiles from Github...\n"
cd ~

mkdir Git && cd Git
git clone git@github.com:silverben10/dot.git
cd ~
echo "\nSuccessfully cloned your dotfiles!\n"

# Symlink dotfiles to their correct places.
echo "Symlinking your dotfiles...\n"
ln -s ~/dot/.config ~/
ln -s ~/dot/.gitconfig ~/
ln -s ~/dot/.zshrc ~/
ln -s ~/dot/.yarnrc ~/

# Install Pikaur
echo "Installing Pikaur...\n"
sudo pacman -S base-devel
git clone https://aur.archlinux.org/pikaur.git
cd pikaur
makepkg -fsri
cd ~

# Install most-used applications
applications=(
  alacritty
  albert
  authy-snap
  bat
  chromium
  exa
  ffmpeg
  firefox
  flameshot
  keybase-bin
  latte-dock-git
  neovim
  nvm
  python-pip
  solaar
  spotify
  starship
  unzip
  unzip
  vim
  yarn
  youtube-dl
  zsh
)

echo "Installing most-used applications...\n"
pikaur -S ${applications[@]}

# Install fonts
fonts=(
  otf-san-francisco-pro
  noto-fonts
  ttf-hack
  ttf-monaco
  ttf-twemoji
)

echo "Installing fonts...\n"
pikaur -S ${fonts[@]}

# Install and set up Oh My Zsh
echo "Installing and setting up Oh My Zsh...\n"
cd ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --keep-zshrc

echo "Installing OMZ plugins...\n"
cd ~
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "\nInstallation complete. Probably worth a restart or something to make sure it all works..."