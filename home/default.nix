{ config, pkgs, lib, inputs, ... }:

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
		nsh = "nix-shell";
		ga = "git add";
		gc = "git commit -m";
		gs = "git status";
		tnew = "tmux new -s";
		tkill = "tmux kill-session";
	};

	repo = "${config.home.homeDirectory}/.nixosbtw/home";
	link = name: config.lib.file.mkOutOfStoreSymlink "${repo}/${name}";

in{
	home.stateVersion = "26.05";

	programs.bash = { enable = true; shellAliases = aliases; };
	programs.waybar.enable = true;
	programs.starship = { enable = true; enableBashIntegration = true; };

	xdg.configFile = lib.genAttrs [ "foot" "sway" "tmux" "tofi" "waybar" ] (n: { source = link n; });

	imports = [
		./neovim
	];
}
