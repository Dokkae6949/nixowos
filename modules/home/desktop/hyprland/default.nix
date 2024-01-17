{ lib, config, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.desktop.hyprland;
in
{
  options.kmve.desktop.hyprland = {
    enable = mkEnableOption "Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
    
    };
  };
}
