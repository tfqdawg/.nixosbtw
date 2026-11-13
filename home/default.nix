{ config, pkgs, ... }:

let
  aliases = {
    vi = "nvim";
    hiscw = "history -c && history -w";
    ls = "ls -ll";
    la = "ls -la";
    lsg = "sudo nix-env --list-generations -p /nix/var/nix/profiles/system";
    dga = "sudo nix-collect-garbage -d";
    dgs = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations";
    ncg = "sudo nix-collect-garbage";
    nrf = "sudo nixos-rebuild switch --flake .";
    nd = "nix develop";
    ga = "git add";
    gc = "git commit -m";
    gs = "git status";
    tses = "tmux new -s";
    tkill = "tmux kill-session";
  };

in{
  imports = [
    ./nixvim
    ./symlinks.nix
  ];
  
  programs.bash = {
    enable = true;
    shellAliases = aliases;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  xdg.configFile."foot/foot.ini".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/foot/foot.ini";

  xdg.configFile."tmux/tmux.conf".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/tmux/tmux.conf";

  xdg.configFile."tmux/keybinds.conf".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/.nixosbtw/tmux/keybinds.conf";
}
