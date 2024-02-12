{ config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.apps.music.spotify;
in
{
  options.nixowos.apps.music.spotify = {
    enable = mkEnableOption "Spotify";
    openPorts = mkBoolOpt true "Whether or not to open ports spotify needs.";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ spotify ];

    networking = {
      firewall = {
        allowedTCPPorts = [
          57621
	  8081
	];
	allowedUDPPorts = [
          5353
	];
      };
    };
  };
}
