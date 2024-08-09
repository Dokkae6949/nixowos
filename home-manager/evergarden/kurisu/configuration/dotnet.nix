{ pkgs
, ...
}:

{
  home = {
    packages = with pkgs; [
      # (with dotnetCorePackages; combinePackages [
      #   sdk_7_0
      #   sdk_8_0
      #   sdk_9_0
      # ])
      pcsc-dotnet
    ];
  };
}
