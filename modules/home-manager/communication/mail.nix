{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.communication.mail;
in
{
  options.uwu.communication.mail = {
    enable = lib.mkEnableOption "Whether to enable mail features";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      mailspring
    ];
  };
}
