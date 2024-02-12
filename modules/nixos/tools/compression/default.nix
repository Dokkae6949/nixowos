{ config, lib, pkgs, ... }:

with lib;
with lib.nixowos;
let 
  cfg = config.nixowos.tools.compression;
in
{
  options.nixowos.tools.compression = with types; {
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
