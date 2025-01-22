{ pkgs
, config
, ...
}:

let
  # Change this to your username.
  user = "kurisu";
  # Change this to match your system's CPU.
  platform = "amd";
  # Change this to specify the IOMMU ids you wrote down earlier.
  vfioIds = [ "10de:24dd" "10de:228b" ];
in
{
  boot = {
    kernelModules = [ "kvm-${platform}" "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" ];
    kernelParams = [ "${platform}_iommu=on" "${platform}_iommu=pt" "kvm.ignore_msrs=1" ];
    extraModprobeConfig = "options vfio-pci ids=${builtins.concatStringsSep "," vfioIds}";
  };

  # Add a file for looking-glass to use later. This will allow for viewing the guest VM's screen in a
  # performant way.
  systemd.tmpfiles.rules = [
    "f /dev/shm/looking-glass 0660 ${user} qemu-libvirtd -"
  ];

  # Add virt-manager and looking-glass to use later.
  environment.systemPackages = with pkgs; [
    looking-glass-client
  ];

  users.users.${user}.extraGroups = [ "qemu-libvirtd" "libvirtd" "disk" ];

  virtualisation = {
    libvirtd = {
      enable = true;

      # Don't start any VMs automatically on boot.
      onBoot = "ignore";
      # Stop all running VMs on shutdown.
      onShutdown = "shutdown";
      
      extraConfig = ''
         user="${user}"
       '';
      
      qemu = {
        package = pkgs.qemu_kvm;
        ovmf.enable = true;
        verbatimConfig = ''
          namespaces = []
          user = "+${builtins.toString config.users.users.${user}.uid}"
        '';
      };
    };

    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;
}
