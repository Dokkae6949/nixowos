{ options, config, lib, pkgs, ... }:

with lib;
with lib.kmve;
let cfg = config.kmve.tools.direnv;
in
{
  options.kmve.tools.direnv = with types; {
    enable = mkBoolOpt false "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    kmve.home.extraOptions = {
      programs.direnv = {
        enable = true;
        nix-direnv = enabled;
      };
    };
  };
}
