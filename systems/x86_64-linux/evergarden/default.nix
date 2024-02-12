{ pkgs, config, lib, channel, ... }:

with lib;
with lib.nixowos;
{
  nixowos = {
    user = {
      name = "kurisu";
      fullName = "Finn Linck Ryan";
      email = "finnliry@gmail.com";
    };

    services = {
      greetd = {
        enable = true;
	defaultSessionCommand = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
      };

      printing = = {
        enable = true;
	drivers = [ pkgs.cnijfilter2 ];
    };

    apps = {
      shells.fish = enabled;

      music = {
        spotify = enabled;
      };
    };

    hardware = {
      nvidia = {
        enable = true;
	driver = "vulkan_beta";
	prime = true;
	amdgpuBusId = "PCI:6:0:0";
	nvidiaButId = "PCI:1:0:0";
      };

      networking = enabled;
    };

    desktops = {
      hyprland = enabled;
    };
  };
}
