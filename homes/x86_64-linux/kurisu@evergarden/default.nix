{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:

with lib.nixowos;
{
  nixowos = {
    user = {
      enable = true;
      name = config.nixowos.user.name;
    };

    apps = {
      home-manager = enabled;

      shells.fish = enabled;

      neovim = {
        enable = true;
        aliases = true;
        defaultEditor = true;
      }

      spotify = enabled;
    };

    desktops = {
      hyprland = disabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
    };
  };
}
