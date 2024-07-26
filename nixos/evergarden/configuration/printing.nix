{ pkgs, ... }:

{
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        cnijfilter2
      	#samsung-unified-linux-driver
        samsung-unified-linux-driver_1_00_37
        gutenprint
        gutenprintBin
        splix
      ];
    };

    avahi = {
      enable = true;
      # nssmdns4 = true;
      openFirewall = true;
    };
  };
}
