{ lib, config, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.apps.eza;
in
{
  options.nixowos.apps.eza = {
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

