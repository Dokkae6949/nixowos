{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.hacking.net;
in
{
  options.uwu.hacking.net = {
    enable = lib.mkEnableOption "Enable net hacking tools";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nmap
      wireshark
      netcat
      socat
      tcpdump
    ];
  };
}
