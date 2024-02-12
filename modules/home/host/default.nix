{ lib, config, pkgs, host ? null, format ? "unknown", ... }:

with lib;
with lib.nixowos;
{
  options.nixowos.host = with types; {
    name = mkOpt (nullOr str) host "The host name.";
  };
}
