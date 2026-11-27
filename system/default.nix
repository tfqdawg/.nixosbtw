{ config, pkgs, ... }:

{
  imports = [
		./hardware-configuration.nix
		./nvidia.nix
		./wdblue.nix
    ./misc.nix
    ./sway.nix
    ./services.nix
    ./packages.nix
		./code.nix
	];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "26.05";

  users.users."tau" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  time.timeZone = "Asia/Kuala_Lumpur";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.hostName = "tau";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

	fonts.packages = with pkgs; [ crimson-pro ];

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
