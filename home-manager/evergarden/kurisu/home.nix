{ inputs
, outputs
, ...
}:

{
  imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-index-database.hmModules.nix-index

    ./configuration
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
      outputs.overlays.master-packages

      inputs.hyprpanel.overlay
    ];

    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "dotnet-sdk-7.0.410"
      ];
    };
  };

  home = {
    username = "kurisu";
    homeDirectory = "/home/kurisu";
  };

  # Enable essential programs
  programs = {
    home-manager.enable = true;
    git.enable = true;
    nix-index.enable = true;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
