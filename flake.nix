{
	description = "My super duper cute and awesome NixOwOs system flake >,<";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11"

		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs: {
		inputs.snowfall-lib.mkFlake {
			inherit inputs;
			src = ./.;

			snowfall = {
				root = ./nix;
				namespace = "nixowos";
				meta = {
					name = "nixowos";
					title = "NixOwOs";
				};
			};
		};
	};
}
