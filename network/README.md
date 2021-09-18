# Network

## Start systemd-network services
systemctl start systemd-network
systemctl start systemd-resolved

systemctl enable systemd-network
systemctl enable systemd-resolved

## Tutorial to link iwd to systemd-network
Create the folder /etc/iwd
The file main.conf must be copied in /etc/iwd/

## Start iwd service
systemctl start iwd

systemctl enable iwd

## Setup Wifi with iwctl
