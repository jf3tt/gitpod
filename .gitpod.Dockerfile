FROM ubuntu:kinetic
ENV HOME=/home/gitpod
WORKDIR $HOME

RUN groupadd -g 33333 gitpod && useradd -g gitpod -u 33333 gitpod \
    # Remove `use_pty` option and enable passwordless sudo for users in the 'sudo' group
    # To emulate the workspace-session behavior within dazzle build env
    && mkdir /workspace && chown -hR gitpod:gitpod /workspace

RUN chmod g+rw /home && \
    mkdir -p /workspace && \
    chown -R gitpod:gitpod /home/gitpod && \
    chown -R gitpod:gitpod /workspace;


# USER gitpod

ENV SHELL /bin/bash
ENV USE_LOCAL_GIT true


# Give control to gitpod
USER root

# Gitpod configuration
ENV GITPOD_HOME /home/gitpod
ENV GITPOD_UID_GID 33333

# Keep the stemn user configuration
# RUN chown -R $GITPOD_UID_GID:$GITPOD_UID_GID $GITPOD_HOME

# Remove root user config that gitpod copies over
RUN rm -rf /root
RUN mkdir -p /root
RUN touch /root/dontremove

RUN apt update && \
    apt install -y \
    software-properties-common \
    git \
    tmux \
    fish \
    neovim \
    sudo \
    zsh \ 
    curl \
    fonts-firacode

COPY .dotfiles /home/gitpod/.config

RUN chmod -R 0777 /home/gitpod/.config

# RUN /home/gitpod/.config/setup.sh

CMD ["/bin/sh", "-c", "fish"]