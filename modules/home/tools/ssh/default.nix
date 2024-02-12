{ lib, config, pkgs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.tools.ssh;
in
{
  options.nixowos.tools.ssh = {
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
