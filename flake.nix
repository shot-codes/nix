{
	description = "GLaDOS NixOS configuration flake.";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";
		home-manager.url = "github:nix-community/home-manager/release-23.11";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
		hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
	};

	outputs = { self, nixpkgs, disko, home-manager, ...}@inputs: {
		nixosConfigurations.GLaDOS = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./configuration.nix
				disko.nixosModules.disko
				./disk-config.nix
				{
					_module.args.disks= ["/dev/nvme0n1"];
				}
				home-manager.nixosModules.home-manager
				{
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.shot = import ./home.nix;
				}
			];
		};
	};	
}
