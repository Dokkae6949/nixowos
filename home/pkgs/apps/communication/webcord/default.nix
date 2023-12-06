{ config, pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    webcord-vencord
  ];
}
