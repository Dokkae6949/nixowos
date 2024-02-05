{config, pkgs-stable, pkgs-unstable, pkgs-master, ...}:

{
  imports = [];

  home.packages = with pkgs-master; [
    prismlauncher
  ];
}
