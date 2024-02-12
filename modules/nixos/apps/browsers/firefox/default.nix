{ config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.apps.browsers.firefox;
in
{
  options.nixowos.apps.browsers.firefox = {
    
  };
}