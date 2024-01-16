{ options, config, lib, ... }:

with lib;
with lib.kmve;
let 
  cfg = config.kmve.system.xkb;
in
{
  options.kmve.system.xkb = with types; {
    enable = mkBoolOpt false "Whether or not to configure xkb.";
  };

  config = mkIf cfg.enable {
    console.useXkbConfig = true;
    services.xserver = {
      layout = "us";
      xkbOptions = "caps:escape";
    };
  };
}
