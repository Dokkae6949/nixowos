{ config, lib, pkgs, ... }:

with lib;
with lib.kmve;
let 
  cfg = config.kmve.tools.compression;
in
{
  options.kmve.tools.compression = with types; {
    enable = mkBoolOpt false "Various file compression programms";
  };

  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      zip
      unzip
      
      gzip
      gunzip
      
      rar
      unrar

      bzip2
      bunzip2
      
      tar
      
      p7zip
    ];
  };
}
