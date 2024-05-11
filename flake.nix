{
	description = "GLaDOS NixOS configuration flake.";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
		disko.url = "github:nix-community/disko";
		disko.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = { self, nixpkgs, disko, ...}@inputs: {
		nixosConfigurations.GLaDOS = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs.inputs = inputs;
			modules = [
				./configuration.nix
				disko.nixosModules.disko
				./disk-config.nix
				{
					_module.args.disks= ["/dev/nvme0n1"];
				}
			];
		};
	};	
}
