{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: 

{
  imports = [
    # If you want to use modules your own flake exports (from modules/nixos):
    outputs.nixosModules.storage-optimization

    # Import extra configuration files
    ./configuration

    # Import generated (nixos-generate-config) hardware configuration
    ./hardware-configuration.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.master-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  uwu = {
    nix.storage-optimization.enable = true;
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
      trusted-users = ["root" "@wheel"];
      substituters = [
        "https://hyprland.cachix.org"
        "https://cuda-maintainers.cachix.org"
        "https://anyrun.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
        "anyrun.cachix.org-1:pqBobmOjI7nKlsUMV25u9QHa9btJK65/C8vnO3p346s="
      ];
    };

    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };
  
  environment = {
    systemPackages = with pkgs; [
      keyd
      cudatoolkit
    ];
  };

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "23.05";
}
