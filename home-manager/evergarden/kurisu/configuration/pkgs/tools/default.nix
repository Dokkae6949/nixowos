{ pkgs, inputs, ...}:

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

  home.packages = with pkgs; [
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
    postman
    encfs
    pwntools
    nmap
    exiftool
    file
    apktool
    hexedit
    insomnia
    burpsuite-fixed
    gh
    arp-scan
    graphviz
    networkmanagerapplet

    # Cyber Security
    openvpn3
    samba
    
    powershell
    appimage-run
    yazi
    grimblast
  ];
}
