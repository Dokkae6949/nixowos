{ config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.desktops.hyprland;
in
{
  options.nixowos.desktops.hyprland = {
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
