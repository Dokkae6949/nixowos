{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.hacking.binary;
in
{
  options.uwu.hacking.binary = {
    enable = lib.mkEnableOption "Enable binary hacking tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      python3
      pwntools

      ghidra
      gdb
      pwndbg
      hexedit
      file
    ];
  };
}
