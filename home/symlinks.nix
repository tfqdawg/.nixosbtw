{ config, ... }:

{
  # sway
  xdg.configFile."sway/config".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/sway/config";
  
  # waybar
  programs.waybar.enable = true;
  xdg.configFile."waybar/config.jsonc".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/waybar/config.jsonc";

  xdg.configFile."waybar/style.css".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/waybar/style.css";

  xdg.configFile."waybar/powermenu.sh".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/waybar/powermenu.sh";

  # tofi
  xdg.configFile."tofi/config".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/tofi/config";
}
