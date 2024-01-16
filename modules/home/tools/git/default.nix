{ lib, config, pkgs, ... }:

with lib;
with lib.kmve;
let
  cfg = config.kmve.tools.git;
  user = config.kmve.user;
in
{
  options.kmve.tools.git = with types; {
    enable = mkEnableOption "Git";
    userName = mkOpt str user.fullName "The name to configure git with.";
    userEmail = mkOpt str user.email "The email to configure git with.";
  };

  config = mkIf cfg.enable {
    programs.git = {
      enable = true;

      inherit (cfg) userName userEmail;
      
      lfs = enabled;
      
      extraConfig = {
        init = { defaultBranch = "main"; };
        pull = { rebase = false; };
        push = { autoSetupRemote = true; };
        core = { whitespace = "trailing-space,space-before-tab"; };
      };
    };
  };
}
