#!/bin/bash
docker build -t web-server:main .
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -yq upgrade
sudo DEBIAN_FRONTEND=noninteractive apt -yq install fluxbox xvfb novnc firefox x11vnc xterm
brew install gh
wget https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-405.0.0-linux-x86_64.tar.gz
tar -xvf google-cloud-cli-405.0.0-linux-x86_64.tar.gz
sudo ln -s google-cloud-sdk/bin/gcloud /usr/bin
sudo cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb
sudo DEBIAN_FRONTEND=noninteractive apt -yq install ./packages-microsoft-prod.deb
sudo apt update
sudo DEBIAN_FRONTEND=noninteractive apt -yq install powershell