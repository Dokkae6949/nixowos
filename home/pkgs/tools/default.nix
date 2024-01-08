{config, pkgs-stable, pkgs-unstable, ...}:

{
  imports = [
    ./git
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
    
    powershell
  ];
}
