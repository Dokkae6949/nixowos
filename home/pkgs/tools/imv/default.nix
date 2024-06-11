{ config, pkgs, pkgs-unstable, ... }:

{
  programs.imv = {
    enable = true;
    package = pkgs-unstable.imv;
    settings = {
      options = {
        background = "1e1e2e";
        overlay_text_color = "cdd6f4";
        overlay_background_color = "11111b";
      };
    };
  };
}
