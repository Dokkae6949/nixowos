{config, pkgs-unstable, ...}:

{
  home.packages = with pkgs-unstable; [
    osu-lazer-bin
  ];
}
