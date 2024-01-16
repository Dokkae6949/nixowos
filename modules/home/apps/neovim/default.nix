{ lib, config, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.apps.neovim;
in
{
  options.kmve.apps.neovim = {
    enable = mkEnableOption "Neovim";
    aliases = mkBoolOpt false "Whether or not to enable vi and vim aliases.";
    defaultEditor = mkBoolOpt false "Whether or not to set neovim as the default editor.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      less
    ];

    programs.neovim = {
      enable = true;
      
      viAlias = cfg.aliases;
      vimAlias = cfg.aliases;

      defaultEditor = cfg.defaultEditor;

      extraConfig = ''
        set number relativenumber
      '';
    };
  };
}

