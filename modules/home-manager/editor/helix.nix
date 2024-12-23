{ lib
, config
, pkgs
, ...
}:

let
  cfg = config.uwu.editor.helix;
in
{
  options.uwu.editor.helix = {
    enable = lib.mkEnableOption "Enable the helix editor";
    defaultEditor = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Set the helix editor as the default editor
      '';
    };

    extraSettings = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = ''
        Extra settings to enable in the helix editor
      '';
      example = ''
        {
          theme = "catppuccin_mocha";

          editor = {
            idle-timeout = 0;
            line-number = "relative";
            indent-guides = true;
          };
        }
      '';
    };
    extraLanguages = lib.mkOption {
      type = lib.types.attrs;
      default = {};
      description = ''
        Extra languages to enable in the helix editor
      '';
      example = ''
        {
          language-server.nixd = {
            command = "${pkgs.nixd}/bin/nixd";
          };
        }
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    programs = {
      helix = {
        enable = true;
        defaultEditor = cfg.defaultEditor;
        package = pkgs.helix;

        settings = {
          theme = "catppuccin_mocha";

          editor = {
            idle-timeout = 0;
            line-number = "relative";
          };

          editor.indent-guides = {
            render = true;
            character = "╎";
          };
        } // cfg.extraSettings;

        languages = {
          language-server.nixd = {
            command = "${pkgs.nixd}/bin/nixd";
          };

          language-server.rust-analyzer = {
            command = "${pkgs.rust-analyzer}/bin/rust-analyzer";
          };

          language-server.typescript-language-server = {
            command = "${pkgs.typescript-language-server}/bin/typescript-language-server";
            args = [ "--stdio" "--tsserver=${pkgs.typescript}/lib/node_modules/typescript/lib" ];
          };

          language-server.tinymist = {
            command = "${pkgs.tinymist}/bin/tinymist";
          };

          language-server.clangd = {
            command = "${pkgs.clang-tools}/bin/clangd";
          };

          language-server.marksman = {
            command = "${pkgs.marksman}/bin/marksman";
            args = [ "server" ];
          };

          language-server.pylsp = {
            command = "${pkgs.python312Packages.python-lsp-server}/bin/pylsp";
          };
        } // cfg.extraLanguages;
      };
    };
  };
}
