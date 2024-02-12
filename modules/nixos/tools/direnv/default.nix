{ options, config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.tools.direnv;
in
{
  options.nixowos.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    nixowos.home.extraOptions = {
      programs.direnv = {
        enable = true;
        nix-direnv = enabled;
      };
    };
  };
}
