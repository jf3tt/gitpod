#!/bin/bash

mkdir -p "/home/gitpod/.zsh" 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "/home/gitpod/.zsh/themes/spaceship-prompt" --depth=1
ln -s "/home/gitpod/.zsh/themes/spaceship-prompt/spaceship.zsh-theme" "/home/gitpod/.zsh/themes/spaceship.zsh-theme"

cp /home/gitpod/.config/.zshrc ~/.zshrc