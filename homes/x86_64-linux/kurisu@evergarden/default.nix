{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:

with lib.kmve;
{
  kmve = {
    user = {
      enable = true;
      name = config.kmve.user.name;
    };

    apps = {
      home-manager = enabled;

      shells.fish = enabled;

      neovim = {
        enable = enabled;
        aliases = true;
        defaultEditor = true;
      }
    };

    tools = {
      git = enabled;
      direnv = enabled;
    };
  };
}
