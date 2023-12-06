{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Dokkae6949";
    userEmail = "finnliry@gmail.com";
    package = pkgs.gitFull;
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
