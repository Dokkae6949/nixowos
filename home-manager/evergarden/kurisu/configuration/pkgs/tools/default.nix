{ pkgs, inputs, ...}:

{
  imports = [
    ./git
    ./eza
    # ./neovim
    # ./helix
    ./zoxide
    ./zellij
    ./imv
  ];

  home.packages = with pkgs; [
    jujutsu
  
#    gcc
    clang
    cmake
    scons
    # bear

    # sqldeveloper

    rustup
    openssl
    pkg-config

    python3
    # python311Packages.conda
    python311Packages.pip
    openjdk17
    nodejs_18
    makeWrapper
    sassc
    nvtopPackages.full
    psmisc
    
    zip
    inputs.ext.packages."${system}".ext

    gparted
    postman
    encfs
    exiftool
    apktool
    insomnia
    # burpsuite-fixed
    gh
    fzf
    arp-scan
    graphviz
    networkmanagerapplet

    # Cyber Security
    # openvpn3
    samba
    
    powershell
    typst
    appimage-run
    yazi
    grimblast
  ];
}
