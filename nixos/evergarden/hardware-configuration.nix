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
    blacklistedKernelModules = [ "pn533" "pn533_usb" "nfc" ];
  };
  
  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  services.xserver.videoDrivers = lib.mkDefault ["nvidia" "modesetting"];

  hardware = {
    nvidia = {
      modesetting.enable = lib.mkDefault true;
      powerManagement.enable = lib.mkDefault true;
      powerManagement.finegrained = lib.mkDefault true;
      open = lib.mkForce false;

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
        # vaapiVdpau
        nvidia-vaapi-driver
        libvdpau-va-gl
        pkgs.master.amdvlk
      ];
      extraPackages32 = with pkgs; [
        pkgs.master.driversi686Linux.amdvlk
      ];
    };
  };
}
