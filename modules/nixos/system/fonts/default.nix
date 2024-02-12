{ options, config, pkgs, lib, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.system.fonts;
in
{
  options.nixowos.system.fonts = with types; {
    enable = mkBoolOpt false "Whether or not to manage fonts.";
    enableFontManager = mkBoolOpt true "Whether or not to enable a GUI font manager.";
    fonts = mkOpt (listOf package) [ ] "Custom font packages to install.";
  };

  config = mkIf cfg.enable {
    environment.variables = {
      # Enable icons in tooling since we have nerdfonts.
      LOG_ICONS = "true";
    };

    environment.systemPackages = mkIf cfg.enableFontManager [ pkgs.font-manager ];

    fonts.packages = with pkgs;
      [
        noto-fonts
        noto-fonts-cjk-sans
        noto-fonts-cjk-serif
        noto-fonts-color-emoji
        noto-fonts-emoji
        hack-font
        font-awesome
        ibm-plex
        material-design-icons
        fira-mono
        dejavu_fonts
        fira-code-symbols
        (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      ] ++ cfg.fonts;
  };
}

