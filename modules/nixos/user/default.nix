{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.user;
in {
  options.nixowos.user = with types; {
    name = mkOpt str "" "The name to use for the user account.";
    fullName = mkOpt str "" "The full name of the user.";
    email = mkOpt str "" "The email of the user.";
    initialPassword =
      mkOpt str "password"
      "The initial password to use when the user is first created.";
    extraGroups = mkOpt (listOf str) [] "Groups for the user to be assigned.";
    extraOptions =
      mkOpt attrs {}
      (mdDoc "Extra options passed to `users.users.<name>`.");
  };

  config = {
    assertions = [
      { assertion = (stringLength cfg.name) == 0;
        message = "The users name cannot be left empty.";
      };
      { assertion = (stringLength cfg.fullName) == 0;
        message = "The users full name cannot be left empty.";
      };
      { assertion = (stringLength cfg.email) == 0;
        message = "The users email cannot be left empty.";
      };
    ];

    users.users.${cfg.name} = {
      isNormalUser = true;

      inherit (cfg) name initialPassword;

      home = "/home/${cfg.name}";
      group = "users";

      extraGroups = [] ++ cfg.extraGroups;
    } // cfg.extraOptions;
  };
}
