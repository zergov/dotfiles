FROM ubuntu:latest
WORKDIR /root/dotfiles

RUN apt update && apt install -y neovim curl git

COPY . .

RUN ./setup

CMD ["/bin/bash"]
