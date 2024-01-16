{ lib, config, pkgs, osConfig ? { }, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.user;

  is-linux = pkgs.stdenv.isLinux;
  is-darwin = pkgs.stdenv.isDarwin;

  home-directory =
    if cfg.name == null then
      null
    else if is-darwin then
      "/Users/${cfg.name}"
    else
      "/home/${cfg.name}";
in
{
  options.kmve.user = with types; {
    enable = mkOpt bool false "Whether to configure the user account.";
    name = mkOpt (nullOr str) config.kmve.user.name "The user account.";

    fullName = mkOpt str "Finn Linck Ryan" "The full name of the user.";
    email = mkOpt str "finnliry@gmail.com" "The email of the user.";

    home = mkOpt (nullOr str) home-directory "The user's home directory.";
  };

  config = mkIf cfg.enable (mkMerge [
    {
      assertions = [
        {
          assertion = cfg.name != null;
          message = "kmve.user.name must be set";
        }
        {
          assertion = cfg.home != null;
          message = "kmve.user.home must be set";
        }
      ];

      home = {
        username = mkDefault cfg.name;
        homeDirectory = mkDefault cfg.home;

        file = {
          ".face".source = cfg.icon;
                
          "Desktop/.keep".text = "";
          "Documents/.keep".text = "";
          "Documents/Work/.keep".text = "";
          "Documents/Personal/.keep".text = "";
          "Downloads/.keep".text = "";
          "Music/.keep".text = "";
          "Pictures/.keep".text = "";
          "Videos/.keep".text = "";
          
          "Pictures/${
            cfg.icon.fileName or (builtins.baseNameOf cfg.icon)
          }".source = cfg.icon;
        };
      };
    }
  ]);
}
