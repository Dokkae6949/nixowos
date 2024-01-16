{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let 
  cfg = config.kmve.services.greetd;
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
in
{
  options.kmve.services.greetd = with types; {
    enable = mkEnableOption "Enable greetd service.";
    vt = mkOpt int 1 "Virtual terminal to use.";
    defaultSessionCommand = mkOpt str "${tuigreet} --time --remember --cmd Hyprland" "Command to run on default session.";
  };

  config = mkIf cfg.enable { 
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
    
    services.greetd = {
      enable = true;
      
      vt = cfg.vt;
      
      settings = {
        default_session = {
          command = cfg.defaultSessionCommand;
          user = "greeter";
        };
      };
    };
  };
}
