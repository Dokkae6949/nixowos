{
  description = "A simple flake for the Bevy engine.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { nixpkgs, flake-utils, rust-overlay, ... }@inputs:
  flake-utils.lib.eachDefaultSystem (system:
    let
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs {
        inherit system overlays;
      };
    in
    {
      devShells.default = pkgs.mkShell rec {
        buildInputs = with pkgs; [
          (rust-bin.selectLatestNightlyWith(toolchain: toolchain.default.override {
            extensions = [  ];
            targets = [  ];
          }))

          pkg-config
          udev
          alsa-lib
          vulkan-loader

          # To use the x11 feature
          xorg.libX11
          xorg.libXcursor
          xorg.libXi
          xorg.libXrandr

          # To use the wayland feature
          libxkbcommon
          wayland

          # Linkers.
          # Read here about alternative/faster linkers (https://bevyengine.org/learn/book/getting-started/setup/#enable-fast-compiles-optional)
          mold
          lld
          clang
        ] ++ lib.optionals pkg.stdenv.isDarwin [
          darwin.apple_sdk.frameworks.SystemConfiguration
        ];

        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath buildInputs;
        CARGO_BUILD_JOBS = 8;
      };
    }
  );
}
