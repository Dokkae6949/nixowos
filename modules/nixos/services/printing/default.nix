{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let cfg = config.kmve.services.printing;
in
{
  options.kmve.services.printing = with types; {
    enable = mkBoolOpt false "Whether or not to configure printing support.";
  };

  config = mkIf cfg.enable { 
    services.printing.enable = true; 
  };
}
