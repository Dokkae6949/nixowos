{ options, config, lib, pkgs, ... }:

with lib;
with lib.kmve;
let 
  cfg = config.kmve.tools.direnv;
in
{
  options.kmve.tools.direnv = with types; {
    enable = mkEnableOption "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = enabled;
    };
  };
}
