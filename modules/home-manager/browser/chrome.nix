{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.browser.chrome;
in
{
  options.uwu.browser.chrome = {
    enable = lib.mkEnableOption "Whether to enable chrome";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      google-chrome
    ];
  };
}
