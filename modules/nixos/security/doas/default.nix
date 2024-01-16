{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let 
  cfg = config.kmve.security.doas;
in
{
  options.kmve.security.doas = {
    enable = mkBoolOpt false "Whether or not to replace sudo with doas.";
  };

  config = mkIf cfg.enable {
    security.sudo.enable = false;
    
    security.doas = {
      enable = true;
      extraRules = [{
        users = [ config.kmve.user.name ];
        noPass = true;
        keepEnv = true;
      }];
    };

    # Alias for backward-compat and convenience.
    environment.shellAliases = { sudo = "doas"; };
  };
}

