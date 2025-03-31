{ lib
, ... 
}:

{
  time.timeZone = lib.mkDefault "Europe/Vienna";
  time.hardwareClockInLocalTime = false;
  services.automatic-timezoned.enable = true;
  services.tzupdate.enable = true;
}
