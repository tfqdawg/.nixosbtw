{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  # core.
  wget
  curl
  wl-clipboard
  zip
  unzip
  p7zip
  libarchive
  ffmpeg
  flatpak
  zathura
  htop
  ps_mem
  fzf
  ripgrep
  fd
  killall
  brightnessctl

  # code.
  git
  python3
  rustup
  typst
  tmux

  # c/c++ tools.
  gcc
  gnumake
  cmake
  ninja
  pkg-config
  gdb
  valgrind

  # misc.
  bibata-cursors
  ];
}
