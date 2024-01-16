{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf mkBoolOpt;

  cfg = config.kmve.apps.shells.fish;
in
{
  options.kmve.apps.shells.fish = {
    enable = mkEnableOption "Fish";
    starship = mkBoolOpt true "Enable starship prompt.";
    defaultShell = mkBoolOpt true "Set fish as default shell.";
  };

  config = mkIf cfg.enable {
    users.users.${config.kmve.user.name}.shell = mkIf cfg.defaultShell pkgs.fish;

    programs = {
      fish = {
        enable = true;

        shellAliases = {
          icat = "kitty icat";
        };

        shellInit = ''
          set fish_greeting
        '';
      };

      starship = {
        enable = cfg.starship;

        settings = {
          character = {
            success_symbol = "[[➜]](bold green) ❯](green)";
            error_symbol = "[❯](bold red)";
            vimcmd_symbol = "[❮](bold blue)";
          };

          directory = {
            truncation_length = 4;
            style = "bold yellow";
          };
        };
      };
    };
  };
}
