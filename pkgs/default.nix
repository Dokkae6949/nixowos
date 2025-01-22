# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };
  # godot4-mono = pkgs.callPackage ./godot/4/mono/default.nix { };
  pcsc-dotnet = pkgs.callPackage ./pcsc-dotnet.nix { };
  burpsuite-fixed = pkgs.callPackage ./burpsuite/default.nix { };
  sqldeveloper-latest = pkgs.callPackage ./sqldeveloper-latest.nix { };
}
