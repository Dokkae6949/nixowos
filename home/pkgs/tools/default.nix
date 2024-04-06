{config, pkgs-stable, pkgs-unstable, ...}:

{
  imports = [
    ./git
    ./eza
    ./neovim
    ./helix
    ./zoxide
    ./zellij
  ];

  home.packages = with pkgs-stable; [
#    gcc
    clang
    cmake
    scons
    bear
    gdb

    rustup
    openssl
    pkg-config

    python3
    python311Packages.pip
    openjdk17
    nodejs_18
    makeWrapper
    sassc
    
    zip
    unzip
    unrar
    unp

    gparted
    pkgs-unstable.postman
    encfs
    pwntools
    nmap
    exiftool
    file
    hexedit
    pkgs-unstable.insomnia
    burpsuite
    
    powershell
    appimage-run
    pkgs-unstable.yazi
    grimblast
  ];
}
