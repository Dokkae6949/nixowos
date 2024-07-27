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

  nix = {
    gc = {
      automatic = cfg.enable;
      dates = "weekly";
      options = "--delete-older-than 7d";
      persistent = true;
    };

    optimise = {
      automatic = cfg.enable;
    };
  };
}
