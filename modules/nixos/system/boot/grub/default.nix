{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos; let
  cfg = config.nixowos.system.boot.grub;
in {
  options.nixowos.system.boot.grub = with types; {
    enable = mkBoolOpt false "Whether or not to enable grub booting.";
    kernelPackages = mkOpt package pkgs.linuxPackages_zen "The kernel package to use for grub.";
  };

  config = mkIf cfg.enable {
    boot = {
      supportedFilesystems = [ "ntfs" ];

      # Unsure if needed for the sound card to work????
      #extraModprobeConfig = ''
      #  options snd-intel-dspcfg dsp_driver=3
      #'';
    
      kernelPackages = cfg.kernelPackages;

      loader = {
        efi.canTouchEfiVariables = true;
       
        grub = {
          enable = true;
          useOSProber = true;
          device = "nodev";
          efiSupport = true;
	        default = "saved";
        };
      };      
    };
  };
}
