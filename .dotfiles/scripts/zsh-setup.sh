#!/bin/bash

mkdir -p "/home/gitpod/.zsh" 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir -p "/home/gitpod/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "/home/gitpod/.zsh/spaceship"

cp /home/gitpod/.config/.zshrc ~/.zshrc