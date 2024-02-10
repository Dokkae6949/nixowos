{config, pkgs-stable, pkgs-unstable, ...}:

{
  imports = [
    ./git
    ./eza
    ./neovim
  ];

  home.packages = with pkgs-stable; [
#    gcc
    clang
    cmake
    scons
    bear
    gdb

    rustup
    python3
    openjdk19
    nodejs_18
    makeWrapper
    sassc
    
    zip
    unzip
    unrar
    unp

    gparted
    encfs
    pwntools
    nmap
    exif
    hexedit
    
    powershell
    appimage-run
    pkgs-unstable.yazi
  ];
}
