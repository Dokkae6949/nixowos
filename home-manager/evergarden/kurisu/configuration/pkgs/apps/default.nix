{ pkgs, inputs, ...}:

{
  imports = [
    # ./terminals/kitty
    ./terminals/foot
    ./databases/mongodb
    ./shells/fish
    ./shells/ags
    ./shells/eww
    # ./shells/anyrun
    # ./communication/webcord
    ./communication/vesktop
    ./spotify
    ./zathura
  ];

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    firefox
    google-chrome
    gimp
    figma-linux
    onlyoffice-bin
    obsidian
    obs-studio
    mpv
    tor-browser-bundle-bin
    ani-cli
    _2048-in-terminal
    inputs.catppuccinifier.packages.${pkgs.system}.cli

    # kicad

    vscode
    dotnet-runtime_7 # required for oracledevtools

    # sqldeveloper
    # zed-editor
    # ciscoPacketTracer8
    android-studio
    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [ "github-copilot" ])
    (jetbrains.plugins.addPlugins jetbrains.webstorm [ "github-copilot" ])
    (jetbrains.plugins.addPlugins jetbrains.rust-rover [ "github-copilot" ])
    (jetbrains.plugins.addPlugins jetbrains.rider [ "github-copilot" ])
    
    picocom
    filezilla
    heroic
    mangohud

    godot_4
    godot4-mono
    krita
    aseprite
    ldtk
    (blender.override {
      cudaSupport = true;
    })

    cava
    hyfetch
  ];
}
