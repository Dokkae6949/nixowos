{ config, pkgs-stable, ... }:


let
  colors = config.colorScheme.colors;
in
{
  programs.kitty = {
    enable = true;

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      window_padding_width = 5;
      confirm_os_window_close = 0;

      foreground              = "#${colors.base05}";
      background              = "#${colors.base00}";
      selection_foreground    = "none"; # leave color unchanged
      selection_background    = "#${colors.base03}";
      
      # Cursor colors
      cursor                  = "#${colors.base03}";
      cursor_text_color       = "#${colors.base00}";
      
      # URL underline color when hovering with mouse
      url_color               = "#${colors.base03}";
      
      # Kitty window border colors
      active_border_color     = "#${colors.base0A}";
      inactive_border_color   = "#${colors.base01}";
      bell_border_color       = "#${colors.base09}";
      
      # OS Window titlebar colors
      wayland_titlebar_color  = "system";
      macos_titlebar_color    = "system";
      
      # Tab bar colors
      active_tab_foreground   = "#${colors.base0D}";
      active_tab_background   = "#${colors.base0E}";
      inactive_tab_foreground = "#${colors.base05}";
      inactive_tab_background = "#${colors.base00}";
      tab_bar_background      = "#${colors.base01}";
      
      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#${colors.base00}";
      mark1_background = "#${colors.base04}";
      mark2_foreground = "#${colors.base00}";
      mark2_background = "#${colors.base0E}";
      mark3_foreground = "#${colors.base00}";
      mark3_background = "#${colors.base0C}";
      
      # The 16 terminal colors
      
      # black
      color0  = "#${colors.base01}";
      color8  = "#${colors.base02}";
      
      # red
      color1  = "#${colors.base08}";
      color9  = "#${colors.base08}";
      
      # green
      color2  = "#${colors.base0B}";
      color10 = "#${colors.base0B}";
      
      # yellow	
      color3  = "#${colors.base0A}";
      color11 = "#${colors.base0A}";
      
      # blue
      color4  = "#${colors.base0D}";
      color12 = "#${colors.base0D}";
      
      # magenta
      color5  = "#${colors.base0E}";
      color13 = "#${colors.base0E}";
      
      # cyan
      color6  = "#${colors.base0C}";
      color14 = "#${colors.base0C}";
      
      # white
      color7  = "#${colors.base05}";
      color15 = "#${colors.base04}";
    };
  };
}
