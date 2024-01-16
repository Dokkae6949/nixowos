{ lib, config, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.apps.eza;
in
{
  options.kmve.apps.eza = {
    enable = mkEnableOption "Eza";
    aliases = mkBoolOpt false "Whether or not to enable l, ll, la, lla aliases.";
  };

  config = mkIf cfg.enable {
    programs.eza = {
      enable = true;
      enableAliases = cfg.aliases;
    };
  };
}

