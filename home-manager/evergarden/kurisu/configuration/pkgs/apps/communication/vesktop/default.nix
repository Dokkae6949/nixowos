{ pkgs
, outputs
, ...
}:

{
  home.packages = with pkgs; [
    vesktop
  ];
}
