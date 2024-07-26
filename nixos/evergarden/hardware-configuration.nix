{ inputs, lib, modulesPath, config, pkgs, ... }:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    
    # Hardware specific default configuration
    # inputs.nixos-hardware.nixosModules.lenovo-legion-16achg6-hybrid
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-cpu-amd-pstate
    # inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.nixos-hardware.nixosModules.common-gpu-nvidia
    inputs.nixos-hardware.nixosModules.common-pc-laptop
    inputs.nixos-hardware.nixosModules.common-pc-laptop-ssd

  ];

  boot = {
    initrd = {
      kernelModules = ["amdgpu"];
      availableKernelModules = [
        "nvme"
        "xhci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
      ];
    };

    kernelModules = ["kvm-amd"];
    extraModulePackages = [];
  };

  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/8378-93D9";
    fsType = "vfat";
  };

  fileSystems."/mnt/win11" = {
    device = "/dev/disk/by-uuid/01DA89DC69F0F360";
    options = ["uid=1000" "gid=1000" "dmask=007" "fmask=117"];
  };
  
  fileSystems."/mnt/win10" = {
    device = "/dev/disk/by-uuid/A442475C4247327A";
    options = ["uid=1000" "gid=1000" "dmask=007" "fmask=117"];
  };

  swapDevices = [
    { device = "/var/swapfile";
      size = (1024 * 64) + (1024 * 2); # RAM size + 2GB
    }
  ];
  
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.xserver.videoDrivers = lib.mkDefault ["nvidia" "modesetting"];

  hardware = {
    nvidia = {
      modesetting.enable = lib.mkDefault true;
      powerManagement.enable = lib.mkDefault true;
      open = lib.mkDefault false;

      # We have to overwrite the amd gpu bus Id because
      # On this laptop the ID changes to 6 instead of 5 if 2 disks
      # are present.
      prime = {
        amdgpuBusId = lib.mkDefault "PCI:6:0:0";
        nvidiaBusId = lib.mkDefault "PCI:1:0:0";
      };
      package = lib.mkDefault config.boot.kernelPackages.nvidiaPackages.latest;
    };

    graphics = {
      enable = lib.mkDefault true;
      enable32Bit = lib.mkDefault true;

      package = lib.mkDefault pkgs.mesa.drivers;
      package32 = lib.mkDefault pkgs.pkgsi686Linux.mesa.drivers;

      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        amdvlk
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
    };
  };
}
