{ config, pkgs-unstable, pkgs-stable, ... }:

{
  home.packages = with pkgs-unstable; [
    vesktop
  ];
}
