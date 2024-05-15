{...}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  virtualisation.docker.storageDriver = "btrfs";
  users.users.shot.extraGroups = ["docker"];
}
