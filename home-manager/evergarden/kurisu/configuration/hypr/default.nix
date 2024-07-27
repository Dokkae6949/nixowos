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
      
      LIBVA_DRIVER_NAME = "nvidia";
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";

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
