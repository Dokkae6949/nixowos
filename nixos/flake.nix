{
  description = "My personal NixOS system flake";

  inputs = {
    nixpkgs-deprecated.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = { 
    self, 
    nixpkgs-deprecated, 
    nixpkgs-stable, 
    nixpkgs-unstable, 
    nixpkgs-master, 
    ... 
  }@inputs: 
  let
    system = "x86_64-linux";

    pkgs-deprecated = import nixpkgs-deprecated {
      inherit system;

      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;

      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };

    pkgs-master = import nixpkgs-master {
      inherit system;
      
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };
  in
  {
    nixosConfigurations = {
      ibn-5100-laptop = nixpkgs-unstable.lib.nixosSystem {
        pkgs = pkgs-unstable;

        specialArgs = {
          inherit system;
	  inherit inputs;
	  inherit pkgs-deprecated;
	  inherit pkgs-stable;
	  inherit pkgs-unstable;
	  inherit pkgs-master;
	};

	modules = [
          ./configuration.nix
	];
      };
    };
  };
}
