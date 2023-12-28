{ options, config, lib, pkgs, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.security.keyring;
in
{
  options.kmve.security.keyring = with types; {
    enable = mkBoolOpt false "Whether to enable gnome keyring.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gnome.gnome-keyring
      gnome.libgnome-keyring
    ];
  };
}
