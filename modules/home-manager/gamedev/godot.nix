{ lib
, config
, pkgs
, inputs
, ...
}:

let
  cfg = config.uwu.gamedev.godot;
in
{
  options.uwu.gamedev.godot= {
    enable = lib.mkEnableOption "Whether to enable godot";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      godot4
      godot4-mono
    ];
  };
}
