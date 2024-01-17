{ options, config, pkgs, lib, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.user;
in {
  options.kmve.user = with types; {
    name = mkOpt str "short" "The name to use for the user account.";
    fullName = mkOpt str "Finn Linck Ryan" "The full name of the user.";
    email = mkOpt str "finnliry@gmail.com" "The email of the user.";
    initialPassword =
      mkOpt str "password"
      "The initial password to use when the user is first created.";
    icon =
      mkOpt (nullOr package) defaultIcon
      "The profile picture to use for the user.";
    prompt-init = mkBoolOpt true "Whether or not to show an initial message when opening a new shell.";
    extraGroups = mkOpt (listOf str) [] "Groups for the user to be assigned.";
    extraOptions =
      mkOpt attrs {}
      (mdDoc "Extra options passed to `users.users.<name>`.");
  };

  config = {
    users.users.${cfg.name} = {
      isNormalUser = true;

      inherit (cfg) name initialPassword;

      home = "/home/${cfg.name}";
      group = "users";

      extraGroups = [] ++ cfg.extraGroups;
    } // cfg.extraOptions;
  };
}
