#!/bin/bash
if [ $# != 2 ]
then
    echo "Usage: $0 appId appCertificate"
    echo "About how to retrieve appId appCertificate Check README.md"
    exit
fi

if [ ! -d 'AgoraDynamicKey' ]; then
    echo "Downloading AgoraDynamicKey source code"
    git clone 'https://github.com/AgoraLab/AgoraDynamicKey.git'
else
    echo "AgoraDynamicKey has been downloaded. Try to update it"
    cd AgoraDynamicKey
    git pull --rebase
    cd ..
    pwd
fi

if [ -z `which npm` ]; then
    echo '***************************************'
    echo "node is not found"
    echo "Download node from https://nodejs.org/dist/v4.5.0/node-v4.5.0.pkg and install it" 
    echo "Then Run this again"
    echo '***************************************'
    wget https://nodejs.org/dist/v4.5.0/node-v4.5.0.pkg && open node-v4.5.0.pkg
    exit
else
    npm install
    APP_ID=$1 APP_CERTIFICATE=$2 node index.js 
fi
