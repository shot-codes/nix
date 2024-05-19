{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      gcc
      lua-language-server
      stylua
      ripgrep
    ];
  };
}
