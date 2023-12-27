{ config, pkgs, lib, ... }:

let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";

  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec "$@"
  '';
in 
{
  imports = [ 
    ./hardware-configuration.nix
  ];


  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
    };

    
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };


  boot = {
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
    
    supportedFilesystems = [ "ntfs" ];

    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=3
    '';
  };


  sound.enable = false;

  # Time
#  time.timeZone = "Europe/Vienna";
  time.hardwareClockInLocalTime = true;
  services.automatic-timezoned.enable = true;


  i18n = {
    defaultLocale = "en_US.UTF-8";

    extraLocaleSettings = {
      LC_ADDRESS = "de_AT.UTF-8";
      LC_IDENTIFICATION = "de_AT.UTF-8";
      LC_MEASUREMENT = "de_AT.UTF-8";
      LC_MONETARY = "de_AT.UTF-8";
      LC_NAME = "de_AT.UTF-8";
      LC_NUMERIC = "de_AT.UTF-8";
      LC_PAPER = "de_AT.UTF-8";
      LC_TELEPHONE = "de_AT.UTF-8";
      LC_TIME = "de_AT.UTF-8";
    };
  };


  console.useXkbConfig = true;

  users.users.kurisu = {
    isNormalUser = true;
    description = "Kurisu Evergarden";
    extraGroups = [ "networkmanager" "wheel" "audio" "plugdev" "adbusers" "libvirtd" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  security = {
    rtkit.enable = true;
    pam.services.swaylock = {};
  };

  environment = { 
    sessionVariables = {
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };

    etc = {
      "pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
        context.properties = {
          default.clock.rate = 48000
          default.clock.quantum = 64
          default.clock.min-quantum = 32
          default.clock.max-quantum = 1024
	  default.clock.allowed-rates = [ 44100 48000 ]
        }
      '';
    };

    systemPackages = with pkgs; [
      neovim
    
      wofi
      dunst
      swww
      swaylock
      
      grim
      slurp
      wl-clipboard
      cliphist
      brightnessctl
      playerctl
      xdg-utils

      networkmanagerapplet

      libnotify
      xdg-utils
      lshw

      nvidia-offload
#      cudatoolkit

      waybar
    ];
  };
  
  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  services = {
    greetd = {
      enable = true;
      vt = 1;
      settings = {
        default_session = {
          command = "${tuigreet} --time --remember --cmd Hyprland";
          user = "greeter";
        };
      };
    };

    xserver = {
      layout = "at";
      xkbVariant = "nodeadkeys";
      videoDrivers = ["nvidia"];
    };
  
    pipewire = {
      enable = true;
      
      audio.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;

      alsa = {
        enable = true;
        support32Bit = true;
      };  
    };

    passSecretService = {
      enable = true;
      package = pkgs.libsecret;
    };
    
    gnome.gnome-keyring.enable = true;
  };

  programs = {
    hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      xwayland.enable = true;
    };

    fish = {
      enable = true;
    };

    adb = {
      enable = true;
    };

    steam = {
      enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
  };

  hardware = {
    enableAllFirmware = true;

    pulseaudio = {
      enable = false;
      support32Bit = true;
    };

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;

      nvidiaSettings = true;

      prime = {
        # Different on each machine !!!
        amdgpuBusId = "PCI:6:0:0";
	nvidiaBusId = "PCI:1:0:0";

	offload = {
	  enable = true;
	  enableOffloadCmd = true;
	};
      };

      package = config.boot.kernelPackages.nvidiaPackages.production;
    };
  };

  networking = {
    hostName = "ibn-5100";
    
    networkmanager.enable = true;

#    interfaces = {
#      eno1.ipv4.addresses = [{
#        address = "192.168.0.34";
#	prefixLength = 27;
#      }];
#    };
#    
#    defaultGateway = {
#      address = "192.168.0.33";
#      interface = "eno1";
#    };

    firewall = {
      enable = false;
      allowedTCPPorts = [ 
        57621 # needed for spotify
	8081 # needed for spotify

	53 # dnsmasq DHCP
      ];
      allowedUDPPorts = [
        5353 # needed for spotify
	
	53 # dnsmasq DHCP
      ];  
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    font-awesome
  ];

  system.stateVersion = "23.05"; # Don't change!
}
