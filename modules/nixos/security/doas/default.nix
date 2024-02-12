{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.security.doas;
in
{
  options.nixowos.security.doas = {
    enable = mkBoolOpt false "Whether or not to replace sudo with doas.";
  };

  config = mkIf cfg.enable {
    security.sudo.enable = false;
    
    security.doas = {
      enable = true;
      extraRules = [{
        users = [ config.nixowos.user.name ];
        noPass = true;
        keepEnv = true;
      }];
    };

    # Alias for backward-compat and convenience.
    environment.shellAliases = { sudo = "doas"; };
  };
}

