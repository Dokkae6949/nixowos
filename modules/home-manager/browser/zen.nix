{ lib
, config
, pkgs
, inputs
, ...
}:

let
  cfg = config.uwu.browser.zen;
in
{
  options.uwu.browser.zen = {
    enable = lib.mkEnableOption "Whether to enable zen browser";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      inputs.zen-browser.packages."${system}".default
    ];
  };
}
