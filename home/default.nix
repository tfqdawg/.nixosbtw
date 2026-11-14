{ config, pkgs, lib, ... }:

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
    ga = "git add";
    gc = "git commit -m";
    gs = "git status";
    tnew = "tmux new -s";
    tkill = "tmux kill-session";
  };

	repo = "${config.home.homeDirectory}/.nixosbtw";
  link = name: config.lib.file.mkOutOfStoreSymlink "${repo}/${name}";

in{
  imports = [ ./nixvim ];

	programs.bash = {
		enable = true;
		shellAliases = aliases;
	};

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

	programs.waybar.enable = true;

	# symlinks
	xdg.configFile = lib.genAttrs [ "foot" "tmux" "sway" "waybar" "tofi" ] (n: { source = link n; });
}
