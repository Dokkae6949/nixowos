{ lib
, config
, pkgs
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
    home.packages = with pkgs.master; [
      godot_4
      # godot_4-mono
    ];
  };
}
