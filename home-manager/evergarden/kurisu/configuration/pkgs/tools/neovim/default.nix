{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.nixvim.packages."${pkgs.system}".default
  ];
  
  home.sessionVariables = {
    EDITOR = "nvim";
  };
  
  programs.neovim = {
    enable = false;

    viAlias = true;
    vimAlias = true;
    defaultEditor = false;
  };
}
