# NixOS Configuration

This repo contains my nixos configuration for two hosts:

- `HAL`: AMD desktop with Nvidia GPU, ext4, GRUB.
- `GLaDOS`: Intel/Tuxedo laptop with Nvidia PRIME offload, LUKS + btrfs via disko, systemd-boot.

Shared config lives in `system/` and `home/`. Hardware and host-specific config (hardware
configuration, GPU, bootloader, disks, monitor layout, hostName, stateVersion) lives in `hosts/<host>/`.

Rebuild with `sudo nixos-rebuild switch --flake ~/.config/nixos#<HAL|GLaDOS>`.

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
