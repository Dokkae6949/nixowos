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
    
    ags.url = "github:Aylur/ags";

    catppuccinifier = {
      url = "github:lighttigerXIV/catppuccinifier";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  };

  outputs = { home-manager, nixpkgs-deprecated, nixpkgs-stable, nixpkgs-unstable, nixpkgs-master, nix-colors, ... }@inputs:
  let
    system = "x86_64-linux";
    username = "kurisu";

    pkgs-deprecated = import nixpkgs-deprecated {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      	permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

    pkgs-stable = import nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      	permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      	permittedInsecurePackages = [
          "electron-25.9.0"
        ];
      };
    };

    pkgs-master = import nixpkgs-master {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = (_: true);
        android_sdk.accept_license = true;
      	permittedInsecurePackages = [
          "electron-25.9.0"
        ];
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
