
let
  inherit (lib) mkEnableOption mkIf;

  cfg = config.kmve.apps.neovim;
in
{
  options.kmve.apps.neovim = {
    enable = mkEnableOption "Neovim";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      less
      neovim
    ];
  };
}

