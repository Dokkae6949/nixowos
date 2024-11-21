{ lib
, ... 
}:

{
  time.timeZone = lib.mkDefault "Europe/Vienna";
  time.hardwareClockInLocalTime = true;
  services.automatic-timezoned.enable = true;
  services.tzupdate.enable = true;
}
