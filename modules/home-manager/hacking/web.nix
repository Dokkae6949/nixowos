{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.hacking.web;
in
{
  options.uwu.hacking.web = {
    enable = lib.mkEnableOption "Enable web hacking tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      burpsuite-fixed
    ];
  };
}
