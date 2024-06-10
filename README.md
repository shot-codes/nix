# NixOS Configuration

This repo contains my nixos configuration.

Sometimes Windows decides to take a shit on my linux drive, in which case do the following:

- Boot to live NixOS ISO.
- Mount volumes:
```
sudo mount -o umask=0077 /dev/nvem0n1p1 /mnt/boot
sudo mount -t btrfs -o subvol=/rootfs /dev/nvme0n1p2 /mmt
sudo mount -t btrfs -o subvol=/home /dev/nvme0n1p2 /mmt/home
sudo mount -t btrfs -o subvol=/nix /dev/nvme0n1p2 /mmt/nix
```
- Install: `sudo nixos-install --root /mnt --flake path:/home/shot/.config/nixos#GLaDOS`
