{ config, pkgs, ... }:

{
  programs.zellij = {
    enable = true;
    enableFishIntegration = false;

    settings = {
      theme = "catppuccin-mocha";
    };
  };
}
