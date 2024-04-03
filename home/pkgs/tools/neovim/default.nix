{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    defaultEditor = false;

    extraConfig = ''
      set number relativenumber
    '';
  };
}
