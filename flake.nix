{
  description = "GLaDOS NixOS configuration flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "git+https://github.com/hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hypridle = {
      url = "github:hyprwm/hypridle/";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprcursor-phinger.url = "github:jappie3/hyprcursor-phinger";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    disko,
    home-manager,
    nixvim,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    # pkgs = nixpkgs.legacyPackages.${system};
    pkgs = import nixpkgs {
      system = system;
      overlays = [
        (final: prev: {
          devbox = prev.devbox.overrideAttrs (old: {
            src = prev.fetchFromGitHub {
              owner = "jetify-com";
              repo = "devbox";
              rev = "0bc66cb8d862ddfc8a43171b6cdf0f7804b6e679";
              sha256 = "0000000000000000000000000000000000000000000000000000"; # placeholder to fetch hash
            };
          });
        })
      ];
    };
  in {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations.GLaDOS = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
        ./system/default.nix
        disko.nixosModules.disko
        ./system/disk-config.nix
        {_module.args.disks = ["/dev/nvme0n1"];}
        home-manager.nixosModules.home-manager
        {
          home-manager.extraSpecialArgs = {inherit inputs;};
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.shot = import ./home/default.nix;
        }
      ];
    };
  };
}
