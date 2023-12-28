{ options, config, inputs, pkgs, lib, ... }:

with lib;
let
  cfg = config.kmve.hardware.nvidia;
in
{
  options.kmve.hardware.nvidia = with types; {
    enable = mkEnableOption "Nvidia support";
    prime = mkBoolOpt true "Whether or not to enable nvidia prime support.";
  };

  config = mkIf cfg.enable {
    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = ["nvidia"];
    
    hardware.opengl.enable = true;
    
    hardware.nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      powerManagement.enable = false;
      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of 
      # supported GPUs is at: 
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus 
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.production;

      prime = {
        amdgpuBusId = "PCI:6:0:0";
	nvidiaBusId = "PCI:1:0:0";

	offload = {
          enable = cfg.prime;
	  enableOffloadCmd = true;
	};
      };
    };

    environment.systemPackages = mkIf cfg.prime [ pkgs.kmve.nvidia-offload ];
  };
}

