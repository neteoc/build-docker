
# Pull base image.
FROM ubuntu:16.04
RUN dpkg --add-architecture i386
RUN echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
RUN apt update && apt upgrade -y
RUN apt install -y curl build-essential git openssh-client wget software-properties-common python-software-properties apt-transport-https icnsutils graphicsmagick mono-runtime
RUN wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ && apt update
RUN apt-get install -y --install-recommends winehq-stable
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt install -y nodejs
