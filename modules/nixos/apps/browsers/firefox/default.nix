{ config, lib, pkgs, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.apps.browsers.firefox;
in
{
  options.kmve.apps.browsers.firefox = {
    
  };
}