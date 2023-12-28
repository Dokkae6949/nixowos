{ lib, config, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  inherit (lib.kmve) enabled;

  cfg = config.kmve.apps.home-manager;
in
{
  options.kmve.apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager = enabled;
  };
}
