{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve; let
  cfg = config.kmve.system.boot.grub;
in {
  options.kmve.system.boot.grub = with types; {
    enable = mkBoolOpt false "Whether or not to enable grub booting.";
  };

  config = mkIf cfg.enable {
    boot = {
      supportedFilesystems = [ "ntfs" ];

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
