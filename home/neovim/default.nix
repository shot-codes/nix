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
    viAlias = true;
    defaultEditor = true;
    colorscheme = "alabaster";
    clipboard.register = "unnamedplus";

    globals = {
      mapleader = " ";
    };

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

    keymaps = [
      {
        mode = "i";
        action = "<Esc>";
        key = "jk";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];

    plugins = {
      telescope.enable = true;
      harpoon = {
        enable = true;
        enableTelescope = true;
        keymapsSilent = true;
        keymaps = {
          addFile = "<leader>ha";
          toggleQuickMenu = "<C-e>";
          navFile = {
            "1" = "<leader>hj";
            "2" = "<leader>hk";
            "3" = "<leader>hl";
            "4" = "<leader>hm";
          };
        };
      };
    };
  };
}
