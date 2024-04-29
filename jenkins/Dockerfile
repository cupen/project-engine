FROM jenkins/jenkins:lts-jdk21

USER root

# Setup debian mirrors
# https://mirrors.tuna.tsinghua.edu.cn/help/debian/
# ARG debian_mirror=https:\/\/mirrors.tuna.tsinghua.edu.cn
# RUN sed -i -e 's/http:\/\/deb.debian.org/${debian_mirror}/g' /etc/apt/sources.list.d/debian.sources
RUN sed -i -e 's/http:\/\/deb.debian.org/https:\/\/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list.d/debian.sources
RUN cat /etc/apt/sources.list.d/debian.sources


RUN curl -fsSLo \
  /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg

RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" > /etc/apt/sources.list.d/docker.list

RUN apt-get update && apt-get install -y docker-ce-cli

RUN apt-get install -y \
    python3 \
    python3-pip \
    python3-invoke \
    pipenv 

RUN apt-get install -y nodejs npm 
USER jenkins
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"
