{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.hardware.networking;
in
{
  options.nixowos.hardware.networking = with types; {
    enable = mkBoolOpt false "Whether or not to enable networking support";
    extraOptions = mkOpt attrs {} (mdDoc "Extra options passed to `networking`.");
  };

  config = mkIf cfg.enable {
    nixowos.user.extraGroups = [ "networkmanager" ];

    networking = {
      networkmanager = enabled;

      # interfaces = {
      #   eno1.ipv4.addresses = [{
      #     address = "192.168.0.34";
      #     prefixLength = 27;
      #   }];
      # };
      
      # defaultGateway = {
      #   address = "192.168.0.33";
      #   interface = "eno1";
      # };
    } // cfg.extraOptions;

    # Fixes an issue that normally causes nixos-rebuild to fail.
    # https://github.com/NixOS/nixpkgs/issues/180175
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
