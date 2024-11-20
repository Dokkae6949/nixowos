{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        useOSProber = true;
        device = "nodev";
        efiSupport = true;
        efiInstallAsRemovable = true;
        default = "saved";
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
