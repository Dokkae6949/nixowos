{ lib, pkgs, config, osConfig ? { }, format ? "unknown", ... }:

with lib.kmve;
{
  kmve = {
    user = {
      enable = true;
      name = config.snowfallorg.user.name;
    };

    apps = {
      home-manager = enabled;
      neovim = enabled;
    };

    tools = {
      git = enabled;
      direnv = enabled;
    };
  };
}
