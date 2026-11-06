{ config, pkgs, lib, ... }:

{
  # greeter
  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  # essential services
  services.udisks2.enable = true;
  services.gnome.gnome-keyring.enable = true;
  security.pam.services.greetd.enableGnomeKeyring = true;

  # sway
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraOptions = 
      lib.optionals
        (lib.elem "nvidia" config.services.xserver.videoDrivers)
	  [ "--unsupported-gpu" ];
  };  

  # essential packages
  environment.systemPackages = with pkgs; [
    udiskie
    swayimg
    tofi
    mako
    kdePackages.dolphin
  ];
}
