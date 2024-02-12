{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.tools.git;
  user = config.nixowos.user;
in
{
  options.nixowos.tools.git = with types; {
    enable = mkBoolOpt false "Whether or not to install and configure git.";
    userName = mkOpt types.str user.fullName "The name to configure git with.";
    userEmail = mkOpt types.str user.email "The email to configure git with.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs = enabled;
      config = {
        init = { defaultBranch = "main"; };
        pull = { rebase = false; };
        push = { autoSetupRemote = true; };
        core = { whitespace = "trailing-space,space-before-tab"; };
      };
    };
  };
}
