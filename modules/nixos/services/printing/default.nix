{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.services.printing;
in
{
  options.kmve.services.printing = with types; {
    enable = mkEnableOption "Whether or not to configure printing support.";
    drivers = mkOption { "List of drivers to install for printing support."
      type = types.listOf types.package;
      default = [];
      description = ;
    };
  };

  config = mkIf cfg.enable { 
    services = {
      printing = {
        enable = true;
        drivers = with pkgs; [
          cnijfilter2
        ] ++ cfg.drivers;
      };

      avahi = {
        enable = true;
        nssmdns = true;
        openFirewall = true;
      };
    };
  };
}
