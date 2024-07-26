{ pkgs, ... }:

{
  imports = [
    ./direnv
  ];

  home.packages = with pkgs; [
    btop
    broot
    fd
    bat
    pandoc
    rename
    wget
    inetutils

    # xwaylandvideobridge
    hyprpicker
  ];
}
