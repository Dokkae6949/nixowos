{ lib, config, pkgs, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.tools.ssh;
in
{
  options.kmve.tools.ssh = {
    enable = mkEnableOption "SSH";
  };

  config = mkIf cfg.enable {
    programs.ssh = {
      extraConfig = ''
        Host *
          HostKeyAlgorithms +ssh-rsa
      '';
    };
  };
}
