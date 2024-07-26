{ inputs, pkgs, ... }:
let
  cursor-theme = "catppuccin-mocha-dark-cursors";
  cursor-theme-name = "Catppuccin-Mocha-Dark";
  cursor-package = pkgs.catppuccin-cursors.mochaDark;
in
{
  imports = [
    inputs.hyprland.homeManagerModules.default

    ./hyprland.nix
    ./hyprlock.nix
  ];

  home = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      ANDROID_SDK_ROOT = "/home/kurisu/Android/Sdk";
      ANDROID_HOME = "/home/kurisu/Android/Sdk";
      XCURSOR_THEME = cursor-theme-name;
      HYPRCURSOR_THEME = cursor-theme-name;
      HYPRCURSOR_SIZE = 24;
    };

    pointerCursor = {
      name = cursor-theme;
      package = cursor-package;
      size = 24;

      x11.enable = true;
      gtk.enable = true;
    };

    packages = with pkgs; [
      hyprpicker
      hyprlock

      wofi
      swww
      dunst
      swaynotificationcenter

      playerctl
      brightnessctl
      cliphist
      wl-clipboard
      grim
      libnotify
      wallust
    ];
  };
}
