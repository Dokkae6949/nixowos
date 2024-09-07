{ lib
, config
, pkgs
, inputs
, ...
}:

let
  cfg = config.uwu.audio.spotify;
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  options.uwu.audio.spotify = {
    enable = lib.mkEnableOption "Whether to enable spotify";

    spicetify = {
      enable = lib.mkEnableOption "Whether to enable spicetify";
      theme = lib.mkOption {
        type = lib.types.package;
        default = spicePkgs.themes.catppuccin;
        example = spicePkgs.themes.catppuccin;
        description = "The theme which should be used";
      };
      colorScheme = lib.mkOption {
        type = lib.types.str;
        default = "mocha";
        example = "mocha";
        description = "The color scheme of the specified theme which should be used.";
      };
      # TODO: Allow overwrites of extensions
    };
  };

  config = lib.mkIf cfg.enable {
    # TODO: Figure out the correct way of doing this
    home.packages = lib.mkNotIf cfg.spicetify.enable [
      pkgs.spotify
    ];

    programs.spicetify = lib.mkIf cfg.spicetify.enable {
      enable = cfg.spicetify.enable;
      theme = cfg.spicetify.theme;
      colorScheme = cfg.spicetify.colorScheme;
      enableExtension = with spicePkgs.extensions; [
        fullAppDisplay
        shuffle
        hidePodcasts
      ];
    };
  };
}
