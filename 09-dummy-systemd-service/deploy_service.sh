#!/bin/bash

SCRIPT_SRC=src/dummy.sh
SCRIPT_DEST=/opt/dummy_service/dummy.sh

SERVICE_NAME=dummy.service
SERVICE_SRC=src/dummy.service
SERVICE_DEST=/etc/systemd/system/$SERVICE_NAME

if [[ "$1" == "--rm" ]]; then
    sudo systemctl stop $SERVICE_NAME
    sudo rm $SERVICE_DEST
    exit 0
fi

sudo mkdir -p $(dirname "$SCRIPT_DEST")
sudo cp $SCRIPT_SRC $SCRIPT_DEST

sudo cp $SERVICE_SRC $SERVICE_DEST

sudo sed -i "s|<username>|$USER|g" $SERVICE_DEST
sudo sed -i "s|<script_dest>|$SCRIPT_DEST|g" $SERVICE_DEST

sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME
sudo systemctl start $SERVICE_NAME
