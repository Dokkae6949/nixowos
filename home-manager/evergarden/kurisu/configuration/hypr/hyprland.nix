{ ... }:

let
 scripts = ./resources/scripts;
in
{
  wayland.windowManager.hyprland = {
    enable = true;

    # TODO: Please clean this shit up into seperate files
    settings = {
      source = [
        "${./resources/mocha.conf}"
      ];

      monitor = [
        # This is a workaround which allows me to add 
        # a shadow to the ags bar.
        ",addreserved,0,0,45,0"
      
        "desc:California Institute of Technology 0x1609,2560x1600@165,1080x1080,1"
        "desc:Samsung Electric Company S24D300 0x30333538,1920x1080@60,3000x0,1"
        "DP-3,1920x1080@60,1080x0,1"
        "DP-4,1920x1080@60,0x0,1,transform,1"
        ",preferred,auto,1,mirror,desc:California Institute of Technology 0x1609"
      ];

      exec-once = [
        "${scripts}/startup.sh"
      ];

      input = {
        kb_layout = "at,us,dh";
        kb_variant = ",altgr-intl";
        kb_options = "grp:alt_space_toggle";
        follow_mouse = 1;
        repeat_delay = 300;
        repeat_rate = 50;
        sensitivity = 0.0;
        numlock_by_default = true;

        touchpad = {
          natural_scroll = true;
        };
      };

      device = [
        { name = "logitech-usb-receiver";
          sensitivity = -0.4;
          accel_profile = "flat";
        }
        { name = "logitech-g502-x-plus";
          sensitivity = -0.4;
          accel_profile = "flat";
        }
        { name = "ydotoold-virtual-device";
          kb_layout = "at";
        }
      ];

      debug = {
        disable_logs = false;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        layout = "dwindle";
        
        "col.active_border" = "$mauve $red $peach $green $blue $lavender 37deg";
        "col.inactive_border" = "$surface0";
      };

      decoration = {
        rounding = 12;

        shadow = {
          enabled = false;
          range = 20;
          render_power = 2;
          color = "$crust";
        };

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
          popups = true;
          # xray = true;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.0.5";
        animation = [
          "windows, 1, 10, myBezier, slide"
          "windowsOut, 1, 10, myBezier, popin"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default, slidevert"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master"; # slave, master, inherit
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_min_speed_to_force = 10;
      };

      misc = {
        disable_hyprland_logo = true;
        vrr = 1;
        focus_on_activate = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = false;
      };

      render = {
        direct_scanout = true;
      };

      xwayland = {
        force_zero_scaling = true;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      "$mainMod" = "ALT"; # main modifier
      "$altMod" = "SUPER"; # alternative modifier

      windowrulev2 = [
        "opacity 0.8 0.8,class:(.*)"

        "workspace 2 silent,class:(^.*firefox.*$)"
        "workspace 2 silent,class:(^.*zen.*$)"
        # "workspace 3 silent,class:(^.*jetbrains.*$)"
        "workspace 3 silent,class:(^.*jetbrains.*$),title:^(?!win).*"
        "workspace 4 silent,class:(^.*Godot.*$)"
        "workspace 5 silent,class:(^.*DesktopEditors.*$)"
        "workspace 6 silent,class:(^.*Aseprite.*$)"
        "workspace 8 silent,title:(^.*Spotify.*$)"
        "workspace 9 silent,class:(^.*WebCord.*$)"
        "workspace 9 silent,class:(^.*discord.*$)"
        "workspace 9 silent,class:(^.*vesktop.*$)"
        "workspace 9 silent,class:(^.*Vencord.*$)"
        "workspace 10 silent,class:(^.*steam.*$)"

        "tile,class:(Aseprite)"
        # "fakefullscreen,class:^(code-url-handler)$"
        "fullscreen,class:^(cs2)$"
        "float,class:^(bevy)"
        "center,class:^(bevy)"
        "float,title:^(Android Emulator)"

        # "float,title:(\(DEBUG\))$"
        # "float,initialTitle:^(Godot)$"
        # "float,class:Godot"
        "tile,title:Godot"
        
        # "forceinput,class:(jetbrains)"
        # "windowdance,class:(jetbrains)"
        # "stayfocused,class:(jetbrains)"
        "center,title:(Rename),class:(jetbrains)"
        "center,title:(Move),class:(jetbrains)"
        # "forceinput,title:Godot"
        # "windowdance,title:Godot"
        "nofocus,class:^ghidra-.+$,title:^win.+$,floating:1,fullscreen:0"
      ];

      layerrule = [
        "blur,ags-bar.*"
        "ignorealpha 0.59,ags-bar.*"
        "blur,eww-bar.*"
        "ignorezero,eww-bar.*"
        "blur,wofi"
        "ignorezero,wofi"
        "blur,launcher"
        "ignorezero,launcher"
        "blur,swaync.*"
        "ignorealpha 0.8,swaync.*"
      ];

      bind = [
        "$mainMod, Q, exec, foot"
        "$mainMod SHIFT, Q, killactive,"
        "$mainMod SHIFT, R, exec, ${scripts}/reload.sh"
        "$mainMod SHIFT, M, exit, "
        "$mainMod SHIFT, L, exec, hyprlock"
        "$mainMod, V, togglefloating,"
        "$mainMod, F, fullscreen, 1"
        "$mainMod SHIFT, F, fullscreen, 0"
        "$mainMod, O, exec, hyprctl setprop active opaque toggle"
        "$mainMod, D, exec, tofi-drun --drun-launch=true"
        "$mainMod SHIFT, D, exec, ${scripts}/sidebar.sh toggle"
        "$mainMod, N, exec, swaync-client -t"
        "$altMod, V, exec, cliphist list | tofi | cliphist decode | wl-copy"
        "$mainMod, R, exec, hyprpicker -a"
        "$mainMod SHIFT, S, exec, grimblast --notify --freeze copy area"
        "$mainMod CTRL, S, exec, grimblast --notify --freeze save area \"$HOME/Pictures/screenshots/$(date --iso-8601='ns').png\""
        "$mainMod SHIFT, up, exec, ${scripts}/spotify-volume.sh up"
        "$mainMod SHIFT, down, exec, ${scripts}/spotify-volume.sh down"

        # Move window focus
        "$altMod, left, movefocus, l"
        "$altMod, right, movefocus, r"
        "$altMod, up, movefocus, u"
        "$altMod, down, movefocus, d"
        "$altMod, h, movefocus, l"
        "$altMod, l, movefocus, r"
        "$altMod, k, movefocus, u"
        "$altMod, j, movefocus, d"

        # Move to workspace
        "$mainMod, Tab, workspace, previous"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
      ];

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle"

        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86audiostop, exec, playerctl stop"
      ];

      bindle = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        "SHIFT, XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        "SHIFT, XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
