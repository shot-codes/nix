{...}: {
  virtualisation.docker.enable = true;
  virtualisation.docker.enableOnBoot = false;
  virtualisation.docker.storageDriver = "btrfs";
  virtualisation.docker.daemon.settings = {
    live-restore = false;
  };
  users.users.shot.extraGroups = ["docker"];
}
