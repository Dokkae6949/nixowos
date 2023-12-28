{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let cfg = config.kmve.hardware.networking;
in
{
  options.kmve.hardware.networking = with types; {
    enable = mkBoolOpt false "Whether or not to enable networking support";
    hosts = mkOpt attrs { }
      (mdDoc "An attribute set to merge with `networking.hosts`");
  };

  config = mkIf cfg.enable {
    kmve.user.extraGroups = [ "networkmanager" ];

    networking = {
      hosts = {
        "127.0.0.1" = [ "local.test" ] ++ (cfg.hosts."127.0.0.1" or [ ]);
      } // cfg.hosts;

      networkmanager = {
        enable = true;
        dhcp = "internal";
      };

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
    };

    # Fixes an issue that normally causes nixos-rebuild to fail.
    # https://github.com/NixOS/nixpkgs/issues/180175
    systemd.services.NetworkManager-wait-online.enable = false;
  };
}
