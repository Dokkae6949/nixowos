{
  inputs,
  pkgs,
  ...
}:

let
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  environment.sessionVariables = {
    # Only use the iGPU for rendering. The dGPU can optionally be used for offloading.
    # This will prevent external monitors from working.
    AQ_DRM_DEVICES = "/dev/dri/card0";
  };

  hardware.graphics = {
    # We need to overwrite the drivers to have them match the version hyprland
    # compiles with (or something like that idk)
    package = pkgs-hyprland.mesa.drivers;
    package32 = pkgs-hyprland.pkgsi686Linux.mesa.drivers;
  };
}
