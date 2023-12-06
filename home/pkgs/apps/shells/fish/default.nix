{config, pkgs-stable, ...}:

{
  home.packages = with pkgs-stable; [
    fish
    starship
  ];
}
