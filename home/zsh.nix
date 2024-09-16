{...}: {
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      enableCompletion = false; # enabled in oh-my-zsh
      initExtra = ''
              eval "$(starship init zsh)"
              eval "$(zoxide init zsh)"
        eval "$(direnv hook zsh)"
      '';
      shellAliases = {
        vi = "nvim";
        fastfetch = "fastfetch --logo ~/.config/nixos/media/fastfetch/skull.txt";
        ds = "devbox shell";
      };
      oh-my-zsh = {
        enable = true;
        plugins = ["git" "systemd" "rsync" "kubectl"];
        theme = "terminalparty";
      };
    };

    starship = {
      enable = true;
      settings = {
        aws.disabled = true;
        gcloud.disabled = true;
      };
    };

    zoxide.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true; # see note on other shells below
      nix-direnv.enable = true;
    };
  };
}
