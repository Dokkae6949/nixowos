{

  description = "Home Manager configuration of kurisu";

  inputs = {
    nixpkgs-deprecated.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    devenv = {
      url = "github:cachix/devenv/latest";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
    };

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { home-manager, nixpkgs-deprecated, nixpkgs-stable, nixpkgs-unstable, nixpkgs-master, nix-colors, ... }@inputs:
  let
    system = "x86_64-linux";
    username = "kurisu";

    pkgs-deprecated = import nixpkgs-deprecated {
      system = system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };

    pkgs-stable = import nixpkgs-stable {
      system = system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };

    pkgs-unstable = import nixpkgs-unstable {
      system = system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };

    pkgs-master = import nixpkgs-master {
      system = system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      };
    };
  in
  {
    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      pkgs = pkgs-unstable;
      
      extraSpecialArgs = {
        inherit inputs;
	inherit pkgs-deprecated;
	inherit pkgs-stable;
	inherit pkgs-unstable;
	inherit pkgs-master;
	inherit nix-colors;
      };

      modules = [
        ./home.nix
      ];
    };
  };
}
