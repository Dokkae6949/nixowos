{ lib, config, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.apps.home-manager;
in
{
  options.kmve.apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager.enable = true;
  };
}
