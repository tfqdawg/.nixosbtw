{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./wdblue.nix
    ./unfree.nix
    ./sway.nix
    ./services.nix
    ./packages.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" "exfat" ];

  system.stateVersion = "26.05";

  users.users."tau" = {
    isNormalUser = true;
    description = "tau";
    extraGroups = [ "networkmanager" "wheel" ];
  };

	time.timeZone = "Asia/Kuala_Lumpur";
  i18n.defaultLocale = "en_US.UTF-8";

	fonts.packages = with pkgs; [ crimson-pro nerd-fonts.jetbrains-mono ];

	networking.hostName = "tau";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  hardware.bluetooth.enable = false;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
