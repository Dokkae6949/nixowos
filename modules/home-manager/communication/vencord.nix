{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.communication.vesktop;
in
{
  options.uwu.communication.vesktop = {
    enable = lib.mkEnableOption "Whether to enable vesktop";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      vesktop
    ];
  };
}
