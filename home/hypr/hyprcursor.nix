{inputs, ...}: {
  imports = [
    inputs.hyprcursor-phinger.homeManagerModules.hyprcursor-phinger
  ];
  programs.hyprcursor-phinger.enable = true;
}
