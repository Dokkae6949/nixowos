{ lib
, config
, ...
}:

let
  cfg = config.uwu.nix.storage-collection;
in
{
  options.uwu.nix.storage-optimization = {
    enable = lib.mkEnableOption "Whether to enable all gc tools";
  };
<<<<<<< HEAD
  
  config = lib.mkIf cfg.enable {
    nix = {
      gc = {
        automatic = lib.mkDefault true;
        dates = lib.mkDefault "weekly";
        options = lib.mkDefault "--delete-older-than 7d";
        persistent = lib.mkDefault true;
      };

      optimise = {
        automatic = lib.mkDefault true;
      };
=======

  nix = {
    gc = {
      automatic = cfg.enable;
      dates = "weekly";
      options = "--delete-older-than 7d";
      persistent = true;
    };

    optimise = {
      automatic = cfg.enable;
>>>>>>> 7e7f3c2fae3131ef316f825a875974d610185506
    };
  };
}
