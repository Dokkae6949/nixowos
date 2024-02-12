{ config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let
  cfg = config.nixowos.apps.shells.fish;
in
{
  options.nixowos.apps.shells.fish = {
    enable = mkEnableOption "Fish";
    starship = mkBoolOpt true "Enable starship prompt.";
    defaultShell = mkBoolOpt true "Set fish as default shell.";
  };

  config = mkIf cfg.enable {
    users.users.${config.nixowos.user.name}.shell = mkIf cfg.defaultShell pkgs.fish;

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
