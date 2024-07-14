{inputs, config, pkgs, nix-colors, ... }:

let
  cursor-theme = "catppuccin-mocha-dark-cursors";
  cursor-theme-name = "Catppuccin-Mocha-Dark";
  cursor-package = pkgs.catppuccin-cursors.mochaDark;
in
{
  imports = [ 
    nix-colors.homeManagerModule

    ./pkgs
  ];

  colorScheme = {
    slug = "catppuccin-mocha-24";
    name = "Catppuccin Mocha 24";
    author = "Kiara Grouwstra (https://github.com/KiaraGrouwstra)";
    palette = {
      base00 = "1e1e2e"; # base
      base01 = "181825"; # mantle
      base02 = "313244"; # surface0
      base03 = "45475a"; # surface1
      base04 = "585b70"; # surface2
      base05 = "cdd6f4"; # text
      base06 = "f5e0dc"; # rosewater
      base07 = "b4befe"; # lavender
      base08 = "f38ba8"; # red
      base09 = "f5c2e7"; # pink
      base0A = "f9e2af"; # yellow
      base0B = "a6e3a1"; # green
      base0C = "94e2d5"; # teal
      base0D = "89b4fa"; # blue
      base0E = "cba6f7"; # mauve
      base0F = "f2cdcd"; # flamingo
      base10 = "181825"; # mantle
      base11 = "11111b"; # crust
      base12 = "eba0ac"; # maroon
      base13 = "f5e0dc"; # rosewater
      base14 = "a6e3a1"; # green
      base15 = "89dceb"; # sky
      base16 = "74c7ec"; # sapphire
      base17 = "f5c2e7"; # pink
    };
  };

  home.username = "kurisu";
  home.homeDirectory = "/home/kurisu";
  home.stateVersion = "23.05";

  home.file = {
  };

  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    ANDROID_SDK_ROOT = "/home/kurisu/Android/Sdk";
    ANDROID_HOME = "/home/kurisu/Android/Sdk";
    HYPRCURSOR_THEME = cursor-theme-name;
    HYPRCURSOR_SIZE = 24;
  };

  home.sessionVariables.XCURSOR_THEME = cursor-theme-name;
  home.pointerCursor = {
    name = cursor-theme;
    package = cursor-package;
    size = 24;

    x11.enable = true;
    gtk.enable = true;
  };

  gtk = {
    enable = true;
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome.gnome-themes-extra;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
  };

  programs.home-manager.enable = true;
}
