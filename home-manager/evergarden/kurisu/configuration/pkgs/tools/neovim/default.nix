{ pkgs, inputs, ... }:

{
  home.packages = [
    # inputs.nixvim.packages."${pkgs.system}".default
    pkgs.cutievim
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
