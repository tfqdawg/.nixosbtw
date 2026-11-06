{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./nvidia.nix
    ./wdblue.nix
    ./unfree.nix
    ./sway.nix
    ./locales.nix
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

  fonts.packages = with pkgs; [ crimson-pro ];

  networking.hostName = "tau";
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  hardware.bluetooth.enable = false;

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
