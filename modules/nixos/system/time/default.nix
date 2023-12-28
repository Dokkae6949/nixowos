{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let cfg = config.kmve.system.time;
in
{
  options.kmve.system.time = with types; {
    enable = mkBoolOpt false "Whether or not to configure timezone information.";
    timezone = mkOpt str "Europe/Vienna" "The timezon to use if automatic-timezon is disabled.";
    automatic-timezone = mkBoolOpt true "Whether or not to configure the timezone automatically";
    hardwareClockInLocalTime = mkBoolOpt true "Whether or not to use local time.";
  };

  config = mkIf cfg.enable {
    time.hardwareClockInLocalTime = cfg.hardwareClockInLocalTime;
    time.timeZone = if cfg.automatic-timezone then "" else cfg.timezone;
    services.automatic-timezoned.enable = cfg.automatic-timezone;
  };
}
