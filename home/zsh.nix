{...}: {
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
      enableCompletion = false; # enabled in oh-my-zsh
      initContent = ''
        eval "$(starship init zsh)"
        eval "$(zoxide init zsh)"
        eval "$(direnv hook zsh)"
        function y() {
          local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
          yazi "$@" --cwd-file="$tmp"
          if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            builtin cd -- "$cwd"
          fi
          rm -f -- "$tmp"
        }
      '';
      shellAliases = {
        vi = "nvim";
        fastfetch = "fastfetch --logo ~/.config/nixos/media/fastfetch/skull.txt";
        ds = "devbox shell";
        dr = "devbox run";
        sp = "source .venv/bin/activate";
        nix-shell = "nix-shell --run zsh";
        shuttle = "cargo-shuttle";
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
