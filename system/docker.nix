{...}: {
  virtualisation.docker = {
    enable = false;
    enableOnBoot = false;
    rootless = {
      enable = true;
      setSocketVariable = true;
      daemon.settings = {
        live-restore = false;
        dns = [
          "1.1.1.1"
          "8.8.8.8"
        ];
      };
    };
  };
  users.users.shot.extraGroups = ["docker"];
  hardware.nvidia-container-toolkit.enable = true;
}
