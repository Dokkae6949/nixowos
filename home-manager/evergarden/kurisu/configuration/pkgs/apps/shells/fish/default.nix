{ pkgs, ...}:

{
  programs = {
    fish = {
      enable = true;

      shellAliases = {
        icat = "kitty icat";
        f = "${pkgs.yazi}/bin/yazi";
	      c = "set tmp (mktemp -t \"yazi-cwd.XXXXX\") ; ${pkgs.yazi}/bin/yazi $argv --cwd-file=\"$tmp\" ; if set cwd (cat -- \"$tmp\"); and [ -n \"$cwd\" ]; and [ \"$cwd\" != \"$PWD\" ] ; cd -- \"$cwd\" ; end ; rm -f -- \"$tmp\"";
	      vl = "fusermount -u ~/Vault";
	      vu = "${pkgs.encfs}/bin/encfs ~/.Vault ~/Vault";
      	e = "$EDITOR";
        tree = "${pkgs.eza}/bin/eza --tree";
      };

      shellInit = ''
        set fish_greeting
      '';
    };

    starship = {
      enable = true;

      settings = {
        character = {
          success_symbol = "[[](mauve) ❯](maroon)";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](green)";
        };

        directory = {
          truncation_length = 4;
          style = "bold pink";
        };

        palette = "catppuccin_mocha";

        palettes.catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };
    };
  };
}
