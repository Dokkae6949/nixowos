# This file defines overlays
{inputs, ...}: {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs final.pkgs;

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    pcsc-patched-dotnet = (prev.dotnetCorePackages.combinePackages [
      prev.dotnetCorePackages.sdk_7_0
      prev.dotnetCorePackages.sdk_8_0
      prev.dotnetCorePackages.sdk_9_0
    ]).overrideAttrs (oldAttrs: {
      # name = "pcsc-patched-dotnet";
      postInstall = ''
        # Ensure the target directory exists
        # mkdir -p $out/shared/Microsoft.NETCore.App/8.0.7

        # Copy the pcsclite library to the correct location in the output
        # cp ${prev.pcsclite.lib}/lib/libpcsclite.so.1 $out/shared/Microsoft.NETCore.App/8.0.7/libpcsclite.so.1
        echo "hello world" > $out/test.txt
        mkdir -p $out/awd
      '';
    });

  };

  # When applied, the unstable nixpkgs set (declared in the flake inputs) will
  # be accessible through 'pkgs.unstable'
  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
