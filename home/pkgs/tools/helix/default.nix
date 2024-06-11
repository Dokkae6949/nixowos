{ config, pkgs, ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;

    settings = {
      theme = "catppuccin_mocha";
      editor = {
        idle-timeout = 0;
        line-number = "relative";
        cursorline = true;
        color-modes = true;
      };

      editor.lsp = {
        display-inlay-hints = false;
      };

      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };

      editor.indent-guides = {
        render = true;
      };
    };
    
    languages = {
      language-server.nixd = {
        command = "nixd";
      };
    
      language = [
        { name="rust"; auto-format=true; }
        { name="nix"; language-servers=["nixd"]; }
      ];
    };

    extraPackages = with pkgs; [
      nixd
      #nil
      rust-analyzer
      vscode-langservers-extracted
      clang-tools
      lldb
      jdt-language-server
      nodePackages.typescript-language-server
      python311Packages.python-lsp-server
    ];
  };
}
