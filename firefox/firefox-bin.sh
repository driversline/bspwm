#!/bin/bash

sudo pacman -S --noconfirm curl tar alsa-lib gtk3

cd ~/Downloads || { echo "~/Downloads not found | create to `mkdir ~/Downloads`"; exit 1; }

curl -L -o firefox.tar.bz2 "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US&_gl=1*1irdmrv*_ga*Nzg1NTczMTE0LjE3Mjk5Mzc4NDA.*_ga_MQ7767QQQW*MTcyOTkzNzg0MC4xLjEuMTcyOTkzODA0MS4wLjAuMA.."

tar xjf firefox.tar.bz2

sudo mv firefox /opt

sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

echo "Successfully."

exit 0
