{ lib, config, pkgs, host ? null, format ? "unknown", ... }:

let
  inherit (lib) types;
  inherit (lib.kmve) mkOpt;
in
{
  options.kmve.host = {
    name = mkOpt (types.nullOr types.str) host "The host name.";
  };
}
