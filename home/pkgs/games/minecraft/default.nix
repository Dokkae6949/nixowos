{config, pkgs-stable, pkgs-unstable, ...}:

{
  imports = [];

  home.packages = with pkgs-unstable; [
    minecraft
    optifine
    fabric-installer
  ];
}
