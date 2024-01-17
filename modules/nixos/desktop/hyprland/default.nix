{ config, lib, pkgs, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.desktop.hyprland;
in
{
  options.kmve.desktop.hyprland = {
    enable = mkEnableOption "Hyprland";
    enableNvidiaPatches = mkBoolOpt true "Enable Nvidia Patches";
  };

  config = mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      enableNvidiaPatches = cfg.enableNvidiaPatches;
      xwayland.enable = true;
    };

    

    environment.systemPackages = with pkgs; [
      grim
      slurp
      wl-clipboard
      cliphist
      brightnessctl
      playerctl
      xdg-utils
      libnotify
      waybar
    ];
  };
}