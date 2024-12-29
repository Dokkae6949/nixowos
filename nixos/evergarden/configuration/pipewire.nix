{ ... }:

{
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

    extraConfig.pipewire."92-low-latency" = {
      context.properties = {
        default.clock = {
          rate = 48000;
          quantum = 32;
          min-quantum = 32;
          max-quantum = 1024;
          allowed-rates = [44100 48000 96000];
        };
      };
    };
  };
}
