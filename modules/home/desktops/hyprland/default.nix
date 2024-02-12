{ lib, config, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.desktops.hyprland;
in
{
  options.nixowos.desktops.hyprland = {
    enable = mkEnableOption "Hyprland";
  };

  config = mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
    
    };
  };
}
