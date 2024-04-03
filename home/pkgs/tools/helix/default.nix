{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    
    languages = {
      language = [
        { name="rust"; auto-format=false; }
      ];
    };

    extraPackages = with pkgs; [
      nil
      rust-analyzer
      vscode-langservers-extracted
      clang-tools
      lldb
      jdt-language-server
      nodePackages.typescript-language-server
    ];
  };
}
