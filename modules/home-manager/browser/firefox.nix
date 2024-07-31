{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.browser.firefox;
in
{
  options.uwu.browser.firefox = {
    enable = lib.mkEnableOption "Whether to enable firefox";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      firefox
    ];
  };
}
