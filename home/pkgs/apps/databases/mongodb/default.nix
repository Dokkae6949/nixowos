{ config, pkgs-stable, ... }:

{
  home.packages = with pkgs-unstable; [
    mongodb-compass
    mongosh
  ];
}
