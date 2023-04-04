FROM gitpod/workspace-base

USER gitpod

# Install custom tools, runtime, etc. using apt-get
# For example, the command below would install "bastet" - a command line tetris clone:
#

RUN sudo apt-add-repository ppa:fish-shell/release-3
 
RUN sudo apt-get -q update && \
    sudo apt-get install -yq \
    fish && \
    sudo rm -rf /var/lib/apt/lists/*

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# ENTRYPOINT ["fish"]
#
# More information: https://www.gitpod.io/docs/config-docker/
