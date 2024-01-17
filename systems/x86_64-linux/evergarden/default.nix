{ pkgs, config, lib, channel, ... }:

with lib;
with lib.kmve;
{
  networking.firewall = {
    enable = false;
    allowedTCPPorts = [ 
      57621 # needed for spotify
      8081 # needed for spotify
      53 # dnsmasq DHCP
    ];
    allowedUDPPorts = [
      5353 # needed for spotify
      53 # dnsmasq DHCP
    ];  
  };

  kmve = {
    apps = {
      # Set default shell to fish
      shells.fish = enabled;

      
    };

    desktop.hyprland = enabled;
  };
}