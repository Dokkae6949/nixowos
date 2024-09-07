{ pkgs, ... }:

{
  services.mongodb = {
    enable = true;
    package = pkgs.mongodb-ce;
  };
}
