{ pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        useOSProber = true;
        device = "nodev";
        efiSupport = true;
        # efiInstallAsRemovable = true;
        default = "saved";
        # gfxmodeEfi = "1920x1200";
      };
    };

    supportedFilesystems = ["ntfs"];

    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=3
    '';

    kernelParams = [
      "amd_iommu=on"
    ];

    kernelPackages = pkgs.linuxPackages_zen;
  };
}
