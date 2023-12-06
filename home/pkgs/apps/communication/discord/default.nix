{ config, pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [
    # nss for opening links in browser (or somthing like that)
    (discord.override { 
      nss = nss_latest;
      withVencord = true;
    })
    
    #betterdiscordctl
  ];
}
