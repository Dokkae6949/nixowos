{ lib, config, inputs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.apps.spotify;
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  options.nixowos.apps.spotify = {
    enable = mkEnableOption "Spotify";
  };

  config = mkIf cfg.enable {
    imports = [ inputs.spicetify-nix.homeManagerModule ];

    programs.spicetify = {
      enable = true;
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts

        # Not working anymore. https://github.com/Vexcited/better-spotify-genres seems to be the new replacement.
        #genre
      ];
    };
  };
}