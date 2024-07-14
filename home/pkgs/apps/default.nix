{config, pkgs-stable, pkgs-unstable, pkgs-master, inputs, ...}:

{
  imports = [
    ./terminals/kitty
    ./terminals/foot
    ./databases/mongodb
    ./shells/fish
    ./shells/ags
    ./shells/eww
    ./shells/anyrun
#    ./communication/webcord
    ./communication/vesktop
    ./spotify
    ./zathura
  ];

  services.easyeffects.enable = true;

  home.packages = with pkgs-stable; [
    firefox
    google-chrome
    gimp
    figma-linux
    onlyoffice-bin
    pkgs-unstable.obsidian
    obs-studio
    pkgs-unstable.mpv
    tor-browser-bundle-bin
    pkgs-unstable.ani-cli
    _2048-in-terminal
    inputs.catppuccinifier.packages.${pkgs-unstable.system}.cli

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
    heroic
    pkgs-unstable.mangohud

    pkgs-master.godot_4
    pkgs-unstable.krita
    pkgs-unstable.aseprite
    pkgs-unstable.ldtk
    (pkgs-unstable.blender.override {
      cudaSupport = true;
    })

    cava
    hyfetch
  ];
}
