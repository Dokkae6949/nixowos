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
    };
  };
}
