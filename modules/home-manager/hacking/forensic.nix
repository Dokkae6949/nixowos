{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.hacking.forensic;
in
{
  options.uwu.hacking.forensic = {
    enable = lib.mkEnableOption "Enable forensic hacking tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      exiftool
      hexedit
      file
    ];
  };
}
