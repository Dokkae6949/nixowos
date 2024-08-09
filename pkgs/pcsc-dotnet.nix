{ stdenv
, patchelf
, pcsclite
, dotnetCorePackages
}:

let
  combinedDotnet = dotnetCorePackages.combinePackages [
    dotnetCorePackages.sdk_7_0
    dotnetCorePackages.sdk_8_0
    dotnetCorePackages.sdk_9_0
  ];
in
stdenv.mkDerivation {
  pname = "pcsc-dotnet";
  
  src = combinedDotnet;

  nativeBuildInputs = [patchelf];
  buildInputs = [pcsclite.lib];

  buildPhase = ''
    # Nothing to build since we only patch
    cp -r ${combinedDotnet} $out
  '';

  installPhase = ''
    mkdir -p $out/shared/Microsoft.NETCore.App/8.0.7/
    ln -s ${pcsclite.lib}/lib/libpcsclite.so.1 $out/shared/Microsoft.NETCore.App/8.0.7/libpcsclite.so.1

    # Patch all relevant binaries to include the correct rpath
    for file in $(find $out -type f -exec file {} \; | grep ELF | cut -d: -f1); do
      patchelf --set-rpath ${pkgs.libpcsclite}/lib:$out/lib $file
    done
  '';
}
