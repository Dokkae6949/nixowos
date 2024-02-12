{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.hardware.audio;
in
{
  options.nixowos.hardware.audio = with types; {
    enable = mkBoolOpt false "Whether or not to enable audio support";
  };

  config = mkIf cfg.enable {
    security.rtkit.enable = true;

    nixowos.user.extraGroups = ["audio"];

    hardware.pulseaudio.enable = mkForce false;
    
    services.pipewire = {
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

    environment.etc = {
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
  };
}
