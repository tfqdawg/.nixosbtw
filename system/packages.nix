{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
		# core
		git
		wget
		curl
		wl-clipboard
		zip
		unzip
		p7zip
		libarchive
		zathura
		htop
		tmux
		ripgrep
		fd
		brightnessctl

		# misc
		bibata-cursors
		mullvad-browser
	];
}
