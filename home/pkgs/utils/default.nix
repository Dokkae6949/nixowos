{config, pkgs-stable, pkgs-unstable, ...}:

{
  imports = [
    ./direnv
  ];

  home.packages = with pkgs-stable; [
    btop
    broot
    fd
    bat
    pandoc
    rename
    wget

#    pkgs-unstable.xwaylandvideobridge
    pkgs-unstable.hyprpicker

    tftp-hpa
  ];
}
