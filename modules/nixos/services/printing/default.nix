{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.services.printing;
in
{
  options.nixowos.services.printing = with types; {
    enable = mkEnableOption "Whether or not to configure printing support.";
    drivers = mkOption { 
      type = types.listOf types.package;
      default = [];
      description = "List of drivers to install for printing support.";
    };
  };

  config = mkIf cfg.enable { 
    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [ ] ++ cfg.drivers;
      };

      avahi = {
        enable = true;
        nssmdns = true;
        openFirewall = true;
      };
    };
  };
}
