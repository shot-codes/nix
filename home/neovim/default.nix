{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "alabaster";
        src = pkgs.fetchFromGitHub {
          owner = "shot-codes";
          repo = "alabaster.nvim";
          rev = "2916f15bfd0f77c2b320f0badd338ea2d00add93";
          hash = "sha256-1n9APeQK8lFFv5i+6n7ZkBIxHb/M8goXTftDqWVV/i4=";
        };
      })
    ];
    colorscheme = "alabaster";

    plugins = {
      telescope.enable = true;
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
    };
  };
}
