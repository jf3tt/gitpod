FROM gitpod/workspace-base:latest

COPY .dotfiles /home/gitpod/.config/
USER root

WORKDIR /home/gitpod
USER gitpod

RUN bash ~/.config/setup.sh
RUN bash ~/.config/clean.sh