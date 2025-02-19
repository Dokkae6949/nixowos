{ lib
, config
, inputs
, ...
}:

let
  cfg = config.uwu.window-manager.cosmic;
in
{
  options.uwu.window-manager.cosmic = {
    enable = lib.mkEnableOption "Whether to enable the cosmic window manager";
  };

  config = lib.mkIf cfg.enable {
    imports = [
      inputs.nixos-cosmic.nixosModules.default
    ];
  
    nix.settings = {
      substituters = [ "https://cosmic.cachix.org/" ];
      trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
    };
  };
}
