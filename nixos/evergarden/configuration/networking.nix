{ ... }:

{
  networking = {
    hostName = "evergarden";
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [];
      allowedUDPPorts = [];
    };
  };

  # programs.openvpn3.enable = true;
}
