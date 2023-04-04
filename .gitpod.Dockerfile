FROM gitpod/workspace-base:latest

USER gitpod

RUN 
 
RUN sudo apt-add-repository ppa:fish-shell/release-3 && \
    sudo apt-get -q update && \
    sudo apt-get install -yq \
    fish && \
    sudo rm -rf /var/lib/apt/lists/*

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    rm kubectl 

RUN sudo chsh -s /usr/local/bin/fish

CMD ["fish"]
#
# More information: https://www.gitpod.io/docs/config-docker/
