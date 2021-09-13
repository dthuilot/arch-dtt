# Manual steps of the Archlinux tutorial

## Creation of the installation media

Rufus seems to do the job but need to copy the ISO in dd mode.

## Boot on the installation media

### Networking

I use wifi so by default wlan0 should not have an IP address.
Use iwctl to setup the wifi connexion.

### System clock

```shell
timedatectl set-ntp true
```

### Partionning

I've dual boot with windows so it's going to be a UEFI partionning.

```shell
fdisk -l
fdisk /dev/device
```

Remember the device where is located the efi partition.
Create a / partition and a swap partition.

Format

```shell
mkfs.ext4 /dev/root_partition
mkswap /dev/swap_partition
swapon /dev/swap_partition
```

### Mounting

```shell
mount /dev/root_partition /mnt
mkdir /mnt/efi
mount /dev/efi_partition /mnt/efi
```

### Install essential packages

```shell
pacstrap /mnt base linux linux-firmware
```

### Fstab

```shell
genfstab -U /mnt >> /mnt/etc/fstab
```

### Chroot

```shell
arch-chroot /mnt
```

### Script arch-dtt.sh

```shell
./arch-dtt.sh
```
