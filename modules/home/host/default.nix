{ lib, config, pkgs, host ? null, format ? "unknown", ... }:

with lib;
with lib.kmve;
{
  options.kmve.host = with types; {
    name = mkOpt (nullOr str) host "The host name.";
  };
}
