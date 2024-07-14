{config, pkgs-stable, pkgs-unstable, inputs, ...}:

{
  imports = [
    ./git
    ./eza
    ./neovim
    ./helix
    ./zoxide
    ./zellij
    ./imv
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
    inputs.ext.packages."${system}".ext

    gparted
    dbeaver
    pkgs-unstable.postman
    encfs
    pwntools
    nmap
    exiftool
    file
    apktool
    hexedit
    pkgs-unstable.insomnia
    burpsuite
    gh
    arp-scan
    
    powershell
    appimage-run
    pkgs-unstable.yazi
    grimblast
  ];
}
