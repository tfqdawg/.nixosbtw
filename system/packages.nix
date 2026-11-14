{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # core.
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
  ripgrep
  fd
  brightnessctl

  # code.
  python3
  typst
  tmux

  # c/c++
  gcc
  cmake
  ninja
  pkg-config
  valgrind

  # misc.
  bibata-cursors
  ];
}
