{config, pkgs-stable, pkgs-unstable, ...}:

let
  colors = config.colorScheme.colors;
in
{
  programs = {
    zathura = {
      enable = true;

      options = {
        # enable recoloring per default. Can be disabled by ':set' recolor in the app.
        recolor = true;

	# enable copy to clipboard via selecting text
	selection-clipboard = "clipboard";

        default-fg = "#${colors.base05}";
        default-bg = "#${colors.base00}";

        completion-bg = "#${colors.base02}";
        completion-fg =	 "#${colors.base05}";
        completion-highlight-bg	= "#${colors.base04}";
        completion-highlight-fg	= "#${colors.base05}";
	completion-group-bg = "#${colors.base02}";
	completion-group-fg = "#${colors.base0D}";

	statusbar-fg = "#${colors.base05}";
	statusbar-bg = "#${colors.base02}";

	notification-bg = "#${colors.base02}";
	notification-fg	= "#${colors.base05}";
	notification-error-bg = "#${colors.base02}";
	notification-error-fg =	"#${colors.base08}";
	notification-warning-bg = "#${colors.base02}";
	notification-warning-fg	= "#${colors.base0A}";

	inputbar-fg = "#${colors.base05}";
	inputbar-bg = "#${colors.base02}";

	recolor-lightcolor = "#${colors.base00}";
	recolor-darkcolor = "#${colors.base05}";

	index-fg = "#${colors.base05}";
	index-bg = "#${colors.base00}";
	index-active-fg = "#${colors.base05}";
	index-active-bg = "#${colors.base02}";

	render-loading-bg = "#${colors.base00}";
	render-loading-fg = "#${colors.base05}";

	highlight-color = "#${colors.base04}";
	highlight-fg = "#${colors.base17}";
	highlight-active-color = "#${colors.base17}";
      };
    };
  };
}
