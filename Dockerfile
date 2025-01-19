FROM ubuntu:latest
WORKDIR /root

RUN apt update && apt install -y neovim curl git

COPY . dotfiles

CMD ["/bin/bash"]
