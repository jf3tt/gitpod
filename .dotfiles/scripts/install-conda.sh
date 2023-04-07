#!/bin/bash

curl -o Miniconda3-py310_23.1.0-1-Linux-x86_64.sh https://repo.anaconda.com/miniconda/Miniconda3-py310_23.1.0-1-Linux-x86_64.sh
bash Miniconda3-py310_23.1.0-1-Linux-x86_64.sh -b -p /home/gitpod/miniconda3

sudo ln -s /home/gitpod/miniconda3/bin/conda /usr/bin/conda

conda init fish

conda create -y -n dev