{pkgs, ...}: let
  cudaPkgs = import pkgs.path {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
    config.cudaSupport = true;
  };
in {
  nixpkgs.config.allowUnfree = true; # this one's fine globally, just needed for the cuda package

  services.ollama = {
    enable = true;
    package = cudaPkgs.ollama-cuda;
  };
}
