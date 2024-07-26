{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mongodb-compass
    mongosh
#    mongodb
  ];
}
