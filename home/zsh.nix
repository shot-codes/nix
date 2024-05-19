{pkgs, ...}: {
  programs.zsh = {
    enable = true;
    enableCompletion = false; # enabled in oh-my-zsh
    initExtra = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
    '';
    shellAliases = {
      vi = "nvim";
      fastfetch = "fastfetch --logo ~/.config/nixos/media/fastfetch/skull.txt";
      #  ne = "nix-env";
      #  ni = "nix-env -iA";
      #  no = "nixops";
      #  ns = "nix-shell --pure";
      #  please = "sudo";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "systemd" "rsync" "kubectl"];
      theme = "terminalparty";
    };
  };

  programs.zoxide.enable = true;
}
