
# Pull base image.
FROM ubuntu:16:04
RUN \
    dpkg --add-architecture i386
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
    apt update && apt upgrade -y
    apt install -y curl build-essential git openssh-client wget software-properties-common python-software-properties
    wget -nc https://dl.winehq.org/wine-builds/Release.key && apt-key add Release.key && apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ && apt update
    apt-get install --install-recommends winehq-stable
    curl -sL https://deb.nodesource.com/setup_6.x | bash -
    apt install -y nodejs
