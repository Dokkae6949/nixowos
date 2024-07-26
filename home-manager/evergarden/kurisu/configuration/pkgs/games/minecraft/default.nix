{ pkgs, ...}:

{
  imports = [];

  home.packages = with pkgs; [
    prismlauncher
  ];
}
