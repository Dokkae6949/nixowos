{ options, config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.security.keyring;
in
{
  options.nixowos.security.keyring = with types; {
    enable = mkBoolOpt false "Whether to enable gnome keyring.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gnome.gnome-keyring
      gnome.libgnome-keyring
    ];
  };
}
