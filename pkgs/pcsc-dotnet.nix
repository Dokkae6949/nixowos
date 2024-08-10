{ stdenv
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
  name = "pcsc-dotnet";
  
  src = combinedDotnet;

  buildInputs = [pcsclite.lib];

  postPatchPhase = ''
    # Copy the pcsclite library file into the correct directory
    cp ${pcsclite.lib}/lib/libpcsclite.so.1 $out/shared/Microsoft.NETCore.App/8.0.7/libpcsclite.so.1
  '';
}
