{ lib, config, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.apps.home-manager;
in
{
  options.nixowos.apps.home-manager = {
    enable = mkEnableOption "home-manager";
  };

  config = mkIf cfg.enable {
    programs.home-manager.enable = true;
  };
}
