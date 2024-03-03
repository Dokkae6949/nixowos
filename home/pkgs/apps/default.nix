{config, pkgs-stable, pkgs-unstable, pkgs-master, inputs, ...}:

{
  imports = [
    ./terminals/kitty
    ./databases/mongodb
    ./shells/fish
    ./shells/ags
#    ./communication/webcord
    ./communication/vesktop
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
    pkgs-unstable.mpv
    tor-browser-bundle-bin
    pkgs-unstable.ani-cli

    kicad

    vscode
    dotnet-runtime_7 # required for oracledevtools

#    sqldeveloper
    ciscoPacketTracer8
    androidStudioPackages.beta
    jetbrains.pycharm-professional
    jetbrains.rider
    jetbrains.clion
    pkgs-master.jetbrains.gateway
    (pkgs-master.jetbrains.plugins.addPlugins pkgs-master.jetbrains.idea-ultimate [ "github-copilot" ])
    (pkgs-master.jetbrains.plugins.addPlugins pkgs-master.jetbrains.webstorm [ "github-copilot" ])
    (pkgs-master.jetbrains.plugins.addPlugins pkgs-master.jetbrains.rust-rover [ "github-copilot" ])
    
    picocom
    filezilla
    gamescope
    heroic

    pkgs-master.godot_4
#    pkgs-master.aseprite
    (blender.override {
      cudaSupport = true;
    })

    cava
    hyfetch
  ];
}
