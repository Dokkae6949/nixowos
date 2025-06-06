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
    # ./communication/vesktop
    # ./spotify
    ./zathura
  ];

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    # inputs.zen-browser.packages."${system}".default
    # firefox
    # google-chrome
    gimp
    figma-linux
    onlyoffice-bin
    obsidian
    obs-studio
    mpv
    tor-browser-bundle-bin
    ani-cli
    _2048-in-terminal

    # kicad

    vscode
    # ida-free

    # sqldeveloper
    # zed-editor
    # ciscoPacketTracer8
    android-studio
    # "github-copilot"
    (jetbrains.plugins.addPlugins jetbrains.idea-ultimate [])
    (jetbrains.plugins.addPlugins jetbrains.webstorm [])
    (jetbrains.plugins.addPlugins jetbrains.rust-rover [])
    (jetbrains.plugins.addPlugins jetbrains.rider [])
    (jetbrains.plugins.addPlugins jetbrains.clion [])
    jetbrains.datagrip
    
    picocom
    filezilla
    heroic
    mangohud

    # godot_4
    # godot4-mono
    krita
    #pkgs.master.aseprite
    ldtk
    blockbench
   (blender.override {
     cudaSupport = true;
   })

    cava
    hyfetch
  ];
}
