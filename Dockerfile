FROM alpine:3.8
ENV HOME=/home/gitpod
WORKDIR $HOME
RUN { echo && echo "PS1='\[\e]0;\u \w\a\]\[\033[01;32m\]\u\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\] \\\$ '" ; } >> .bashrc

RUN addgroup -S gitpod -g 33333 && adduser -S gitpod -G gitpod -u 33333 \
    # Remove `use_pty` option and enable passwordless sudo for users in the 'sudo' group
    # To emulate the workspace-session behavior within dazzle build env
    && mkdir /workspace && chown -hR gitpod:gitpod /workspace

RUN chmod g+rw /home && \
    mkdir -p /workspace && \
    chown -R gitpod:gitpod /home/gitpod && \
    chown -R gitpod:gitpod /workspace;


USER gitpod

ENV SHELL /bin/fish
ENV USE_LOCAL_GIT true


# Give control to gitpod
USER root

# Gitpod configuration
ENV GITPOD_HOME /home/gitpod
ENV GITPOD_UID_GID 33333

# Keep the stemn user configuration
RUN chown -R $GITPOD_UID_GID:$GITPOD_UID_GID $GITPOD_HOME

# Remove root user config that gitpod copies over
RUN rm -rf /root
RUN mkdir -p /root
RUN touch /root/dontremove

RUN apk add --no-cache --update \
git \
fish \
util-linux \
tmux \
vim

ENV EDITOR vim

CMD ["/usr/bin/tmux"]