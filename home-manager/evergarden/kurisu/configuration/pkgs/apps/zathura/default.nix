{config, pkgs, ...}:

let
  colors = config.colorScheme.palette;
in
{
  programs = {
    zathura = {
      enable = true;

      options = {
        default-fg              = "rgba(205,214,244,1)";
        default-bg 			        = "rgba(30,30,46,1)";

        completion-bg		        = "rgba(49,50,68,1)";
        completion-fg		        = "rgba(205,214,244,1)";
        completion-highlight-bg	= "rgba(87,82,104,1)";
        completion-highlight-fg	= "rgba(205,214,244,1)";
        completion-group-bg		  = "rgba(49,50,68,1)";
        completion-group-fg		  = "rgba(137,180,250,1)";

        statusbar-fg		        = "rgba(205,214,244,1)";
        statusbar-bg		        = "rgba(49,50,68,1)";

        notification-bg		      = "rgba(49,50,68,1)";
        notification-fg		      = "rgba(205,214,244,1)";
        notification-error-bg	  = "rgba(49,50,68,1)";
        notification-error-fg	  = "rgba(243,139,168,1)";
        notification-warning-bg	= "rgba(49,50,68,1)";
        notification-warning-fg	= "rgba(250,227,176,1)";

        inputbar-fg			        = "rgba(205,214,244,1)";
        inputbar-bg 		        = "rgba(49,50,68,1)";

        recolor                 = "true";
        recolor-lightcolor		  = "rgba(30,30,46,1)";
        recolor-darkcolor		    = "rgba(205,214,244,1)";

        index-fg			          = "rgba(205,214,244,1)";
        index-bg			          = "rgba(30,30,46,1)";
        index-active-fg		      = "rgba(205,214,244,1)";
        index-active-bg		      = "rgba(49,50,68,1)";

        render-loading-bg		    = "rgba(30,30,46,1)";
        render-loading-fg		    = "rgba(205,214,244,1)";

        highlight-color		      = "rgba(87,82,104,0.5)";
        highlight-fg            = "rgba(245,194,231,0.5)";
        highlight-active-color	= "rgba(245,194,231,0.5)";
      };
    };
  };
}
