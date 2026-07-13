{...}: {
  virtualisation.docker = {
    enable = false;
    enableOnBoot = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        live-restore = false;
      };
    };
  };
  users.users.shot.extraGroups = ["docker"];
}
