{ ... }:

{
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
    };

    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;
  services.spice-vdagentd.enable = true;
}
