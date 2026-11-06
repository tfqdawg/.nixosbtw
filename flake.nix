{
  description = "nixos config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.url = "github:nix-community/nixvim/nixos-26.05";
		ember-nvim = { url = "github:ember-theme/nvim"; flake = false; };
  };

  outputs = inputs:
    let
      user = "tau";
      host = "tau";
      system = "x86_64-linux";
    in{
      nixosConfigurations.${host} = inputs.nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system user host; };
        modules = [
          ./system
          inputs.home-manager.nixosModules.home-manager

          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs system user host; };
            };

            home-manager.users.${user} = {
              home.stateVersion = "26.05";
              imports = [
                inputs.nixvim.homeModules.nixvim
                ./home
              ];
            };
          }
				];
      };
    };
}
