{
  config,
  pkgs,
  ...
}: {
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  # xdg.configFile."nvim/lua" = {
  #   recursive = true;
  #   source = ./lua;
  # };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
    extraPackages = with pkgs; [
      gcc
      lua-language-server
      stylua
      shfmt
      ripgrep
    ];

    #    extraLuaConfig = ''
    #      vim.g.mapleader = " " -- Need to set leader before lazy for correct keybindings
    #      require("lazy").setup({
    #        performance = {
    #          reset_packpath = false,
    #          rtp = {
    #              reset = false,
    #            }
    #          },
    #        dev = {
    #          path = "${pkgs.vimUtils.packDir config.home-manager.users.shot.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
    #   patterns = {"folke"},
    #        },
    #        install = {
    #          -- Safeguard in case we forget to install a plugin with Nix
    #          missing = false,
    #        },
    # plugins = with pkgs.vimPlugins; [
    #          which-key-nvim
    #  	];
    #        spec = {
    #          -- Import plugins from lua/plugins
    #          { import = "plugins" },
    #        },
    #      })
    #    '';
  };
}
