#/bin/bash

sudo apt-get clean autoclean
sudo apt-get autoremove --yes
sudo rm -rf /var/lib/{apt,dpkg,cache,log}/