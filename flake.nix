{
	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
		nixvim = { url = "github:nix-community/nixvim"; };
		ember-nvim = { url = "github:ember-theme/nvim"; flake = false; };
	};

	outputs = inputs@{ self, nixpkgs, ... }:{
		nixosConfigurations.tau = nixpkgs.lib.nixosSystem{
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./system
				inputs.home-manager.nixosModules.home-manager{
					home-manager = {
						useGlobalPkgs = true;
						useUserPackages = true;
						extraSpecialArgs = { inherit inputs; };
						users.tau.imports = [ ./home inputs.nixvim.homeModules.nixvim ];
					};
				}
			];
		};
	};
}
