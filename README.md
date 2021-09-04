# Personnal Archlinux tutorial

## Creation of the installation media

Rufus seems to do the job but need to copy the ISO in dd mode.

## Boot on the installation media

### Networking

I use wifi so by default wlan0 should not have an IP address.
Use iwctl to setup the wifi connexion.

### Partionning

I've dual boot with windows so it's going to be a UEFI partionning.

```shell
{
fdisk -l   
}
```
