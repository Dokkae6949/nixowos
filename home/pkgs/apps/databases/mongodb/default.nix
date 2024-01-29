{ config, pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    mongodb-compass
    mongosh
    mongodb
  ];
}
