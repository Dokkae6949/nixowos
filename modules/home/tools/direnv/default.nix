{ options, config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.tools.direnv;
in
{
  options.nixowos.tools.direnv = with types; {
    enable = mkEnableOption "Whether or not to enable direnv.";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv = enabled;
    };
  };
}
