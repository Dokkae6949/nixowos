{config, pkgs-stable, pkgs-unstable, pkgs-master, ...}:

{
  imports = [
    ./terminals/kitty
    ./shells/fish
    ./communication/webcord
    ./communication/discord
    ./spotify
    ./zathura
  ];

  home.packages = with pkgs-stable; [
    firefox
    google-chrome
    gimp
    onlyoffice-bin
    pkgs-unstable.obsidian
    obs-studio
    mpv
    tor-browser-bundle-bin

    vscode
    sqldeveloper
    ciscoPacketTracer8
    androidStudioPackages.beta
    jetbrains.pycharm-professional
    jetbrains.rider
    jetbrains.clion
    pkgs-unstable.jetbrains.idea-ultimate
    pkgs-unstable.jetbrains.webstorm
    pkgs-unstable.jetbrains.rust-rover
    
    picocom
    filezilla
    gamescope

    pkgs-master.godot_4
    pkgs-unstable.reaper
    pkgs-unstable.sonic-pi
    pkgs-unstable.aseprite
    (blender.override {
      cudaSupport = true;
    })


    cava
    hyfetch
  ];
}
