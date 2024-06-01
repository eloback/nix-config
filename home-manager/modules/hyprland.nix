{ pkgs, lib, config, ... }:
with lib;
let cfg = config.custom.hyprland; in {
  options.custom = {
    hyprland.enable = mkEnableOption "enables Hyprland as default desktop.";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      xdg-utils # wl-clipboard uses it
      wl-clipboard
      pavucontrol
      grim
      slurp
    ];
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = true;
      settings = {
        "monitor" = ",preferred,auto,auto";

        # Colors
        "$rosewaterAlpha" = "fff5e0dc";
        "$flamingoAlpha" = "fff2cdcd";
        "$pinkAlpha" = "fff5c2e7";
        "$mauveAlpha" = "ffcba6f7";
        "$redAlpha" = "fff38ba8";
        "$maroonAlpha" = "ffeba0ac";
        "$peachAlpha" = "fffab387";
        "$yellowAlpha" = "fff9e2af";
        "$greenAlpha" = "ffa6e3a1";
        "$tealAlpha" = "ff94e2d5";
        "$skyAlpha" = "ff89dceb";
        "$sapphireAlpha" = "ff74c7ec";
        "$blueAlpha" = "ff89b4fa";
        "$lavenderAlpha" = "ffb4befe";

        "$textAlpha" = "ffcdd6f4";
        "$subtext1Alpha" = "ffbac2de";
        "$subtext0Alpha" = "ffa6adc8";

        "$overlay2Alpha" = "ff9399b2";
        "$overlay1Alpha" = "ff7f849c";
        "$overlay0Alpha" = "ff6c7086";

        "$surface2Alpha" = "ff585b70";
        "$surface1Alpha" = "ff45475a";
        "$surface0Alpha" = "ff313244";

        "$baseAlpha" = "ff1e1e2e";
        "$mantleAlpha" = "ff181825";
        "$crustAlpha" = "ff11111b";

        "$rosewater" = "0xfff5e0dc";
        "$flamingo" = "0xfff2cdcd";
        "$pink" = "0xfff5c2e7";
        "$mauve" = "0xffcba6f7";
        "$red" = "0xfff38ba8";
        "$maroon" = "0xffeba0ac";
        "$peach" = "0xfffab387";
        "$yellow" = "0xfff9e2af";
        "$green" = "0xffa6e3a1";
        "$teal" = "0xff94e2d5";
        "$sky" = "0xff89dceb";
        "$sapphire" = "0xff74c7ec";
        "$blue" = "0xff89b4fa";
        "$lavender" = "0xffb4befe";

        "$text" = "0xffcdd6f4";
        "$subtext1" = "0xffbac2de";
        "$subtext0" = "0xffa6adc8";

        "$overlay2" = "0xff9399b2";
        "$overlay1" = "0xff7f849c";
        "$overlay0" = "0xff6c7086";

        "$surface2" = "0xff585b70";
        "$surface1" = "0xff45475a";
        "$surface0" = "0xff313244";

        "$base" = "0xff1e1e2e";
        "$mantle" = "0xff181825";
        "$crust" = "0xff11111b";

        master = {
          # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
          new_is_master = false;
        };

        gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = "off";
        };

        misc = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
        };


        # Set programs that you use
        "$terminal" = "foot";
        "$fileManager" = "foot fish -C yy";
        "$menu" = "wofi --show drun";
        "$mainMod" = "SUPER";
        bind = [
          "$mainMod, Q, killactive"
          "$mainMod, RETURN, exec, $terminal"
          "$mainMod, APOSTROPHE, exec, $terminal"
          "$mainMod SHIFT, Q, exit"
          "$mainMod, E, exec, $fileManager"
          "$mainMod, V, togglefloating"
          "$mainMod, D, exec, $menu"
          # bind = $mainMod, P, pseudo, # dwindle
          # bind = $mainMod, J, togglesplit, # dwindle
          "$mainMod, 0, exec, wlogout"
          "$mainMod, Y, exec, cliphist list | $menu -dmenu | cliphist decode | wl-copy"
          "$mainMod, F, fullscreen "

          # misc
          # bind = $mainMod CTRL ALT, S, exec, xdg-open Pictures/1712470640_screen.png

          # Move focus with mainMod + arrow keys
          "$mainMod, left, movefocus, l"
          "$mainMod, right, movefocus, r"
          "$mainMod, up, movefocus, u"
          "$mainMod, down, movefocus, d"

          "$mainMod CTRL, J, layoutmsg, swapwithmaster master"

          # Screenshot bindings
          "rint, exec, grim '$HOME/Pictures/$(date +'%s_screen.png')'"
          "SHIFT, Print, exec, grim - | wl-copy"
          #bind = SUPER, C, exec, grim -g "$(slurp)" "$HOME/Pictures/$(date +'%s_screen.png')"
          "SUPER SHIFT, Print, exec, grim -g '$(slurp)' - | wl-copy"


          "XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          "XF86AudioPlay, exec, playerctl play-pause"
          "XF86AudioPause, exec, playerctl play-pause"
          "XF86AudioNext, exec, playerctl next"
          "XF86AudioPrev, exec, playerctl previous"

          # Switch workspaces with mainMod + [0-9]
          "$mainMod, 1, workspace, 1"
          "$mainMod, 2, workspace, 2"
          "$mainMod, 3, workspace, 3"
          "$mainMod, 4, workspace, 4"
          "$mainMod, 5, workspace, 5"
          "$mainMod, 6, workspace, 6"
          "$mainMod, 7, workspace, 7"
          "$mainMod, 8, workspace, 8"
          "$mainMod, 9, workspace, 9"

          # Move active window to a workspace with mainMod + SHIFT + [0-9]
          "$mainMod SHIFT, 1, movetoworkspace, 1"
          "$mainMod SHIFT, 2, movetoworkspace, 2"
          "$mainMod SHIFT, 3, movetoworkspace, 3"
          "$mainMod SHIFT, 4, movetoworkspace, 4"
          "$mainMod SHIFT, 5, movetoworkspace, 5"
          "$mainMod SHIFT, 6, movetoworkspace, 6"
          "$mainMod SHIFT, 7, movetoworkspace, 7"
          "$mainMod SHIFT, 8, movetoworkspace, 8"
          "$mainMod SHIFT, 9, movetoworkspace, 9"

          # Example special workspace (scratchpad)
          "$mainMod, S, togglespecialworkspace, magic"
          "$mainMod CTRL, S, togglespecialworkspace, magic"
          "$mainMod SHIFT, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mainMod + scroll
          "$mainMod, mouse_down, workspace, e+1"
          "$mainMod, mouse_up, workspace, e-1"

        ];
        bindr = [
          "$mainMod, M, exec, pkill pavucontrol || pavucontrol"
        ];
        binde = [
          # Master-Layout bindings
          "$mainMod SHIFT, H, resizeactive, -30 0"
          "$mainMod SHIFT, L, resizeactive,  30 0"
          "$mainMod SHIFT, K, resizeactive,  0  30"
          "$mainMod SHIFT, J, resizeactive,  0 -30"
          "$mainMod, H, movefocus, l"
          "$mainMod, L, movefocus, r"
          "$mainMod, K, movefocus, u"
          "$mainMod, J, movefocus, d"


          # Multimedia bindings
          "XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          "UPER SHIFT CTRL, 4, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          "XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          "UPER SHIFT CTRL, 3, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"


        ];
        bindm = [
          # Move/resize windows with mainMod + LMB/RMB and dragging
          "$mainMod, mouse:272, movewindow"
          "$mainMod, mouse:273, resizewindow"

        ];
      };
      # extraConfig = ''
      #   # Execute your favorite apps at launch
      #   # exec-once=/usr/lib/polkit-kde-authentication-agent-1
      #   # exec-once = wl-paste --type text --watch cliphist store #Stores only text data
      #   # exec-once = wl-paste --type image --watch cliphist store #Stores only image data
      #
      #   # exec-once=[workspace 2 silent] qutebrowser
      #
      #
      #
      #   # Some default env vars.
      #   # env = XCURSOR_SIZE,24
      #   # env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
      #   # default programs
      #   # env = BROWSER,qutebrowser
      #   # env = EDITOR, nvim
      #   # env = VISUAL, nvim
      #   # NVIDIA
      #   # env = LIBVA_DRIVER_NAME,nvidia
      #   # env = XDG_SESSION_TYPE,wayland
      #   # env = GBM_BACKEND,nvidia-drm
      #   # env = __GLX_VENDOOR_LIBRARY_NAME=nvidia
      #   # env = WLR_NO_HARDWARE_CURSORS,1
      #   # env = OZONE_PLATFORM,wayland
      #   # GAMING
      #   # env = WLR_DRM_NO_ATOMIC,1
      #
      #   # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      #   input {
      #       kb_layout = us
      #       kb_variant =
      #       kb_model =
      #       kb_options = caps:escape
      #       kb_rules =
      #
      #       follow_mouse = 1
      #
      #       touchpad {
      #           natural_scroll = no
      #       }
      #
      #       sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      #   }
      #
      #   general {
      #       # See https://wiki.hyprland.org/Configuring/Variables/ for more
      #
      #       gaps_in = 2
      #       gaps_out = 4
      #       border_size = 3
      #       col.active_border = $mauve
      #       col.inactive_border = $mantle
      #       layout = master
      #       # cursor_inactive_timeout = 3
      #
      #       # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
      #       allow_tearing = true
      #   }
      #
      #   decoration {
      #       rounding = 0
      #       active_opacity = 1.0
      #       inactive_opacity = 1.0
      #       fullscreen_opacity = 1
      #       drop_shadow = true
      #       shadow_range = 5
      #       shadow_render_power = 5
      #       blur {
      #           enabled = true
      #           size = 8
      #           passes = 20
      #       }
      #       col.shadow = rgba(1a1a1aee)
      #   }
      #
      #   animations {
      #       enabled = yes
      #
      #       # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
      #
      #       bezier = myBezier, 0.05, 0.9, 0.1, 1.05
      #
      #       animation = windows, 1, 7, myBezier
      #       animation = windowsOut, 1, 7, default, popin 80%
      #       animation = border, 1, 10, default
      #       animation = borderangle, 1, 8, default
      #       animation = fade, 1, 7, default
      #       animation = workspaces, 1, 6, default
      #   }
      #
      #   dwindle {
      #       # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      #       pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      #       preserve_split = yes # you probably want this
      #   }
      #
      #
      #   # Example per-device config
      #   # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      #   # not supported yet
      #   #device:epic-mouse-v1 {
      #   #    sensitivity = -0.5
      #   #}
      #
      #   # Example windowrule v1
      #   # windowrule = float, ^(kitty)$
      #   # Example windowrule v2
      #   # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      #   # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      #   # windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.
      #   windowrulev2 = bordercolor 0xff$skyAlpha,title:^(.*Hypr.*)$ # set bordercolor when title contains Hypr
      #   windowrule = float, file_progress
      #   windowrule = float, confirm
      #   windowrule = float, dialog
      #   windowrule = float, download
      #   windowrule = float, notification
      #   windowrule = float, error
      #   windowrule = float, splash
      #   windowrule = float, confirmreset
      #   windowrule = float, title:Open File
      #   windowrule = float, title:branchdialog
      #   windowrule = float, Lxappearance
      #   windowrule = float, pavucontrol-qt
      #   windowrule = float, pavucontrol
      #   windowrule = workspace 4, discord
      #   windowrule = workspace 5, ncspot
      #   windowrulev2 = workspace 8, class:^(mpv)$
      #
      #   #Gaming
      #   windowrulev2 = immediate, class:^(steam_app)(.*)$
      # '';
    };
    # services.hyprpaper = {
    #   enable = true;
    #   # settings = {
    #   #   # TODO: fetchurl wallpapers.
    #   #   # preload = "~/Pictures/Wallpapers/hkvh.jpg";
    #   #   # wallpaper = "DP-1,~/Pictures/Wallpapers/hkvh.jpg";
    #   # };
    # };
    programs.wofi.enable = true;
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      settings = {
        "layer" = "top";
        "position" = "top";
        # "height"= 30; 
        #  "width"= 1280;
        # "spacing"= 4; 
        "modules-left" = [ "wlr/workspaces" ];
        "modules-center" = [ "hyprland/window" ];
        "modules-right" = [ "custom/updates" "pulseaudio" "network" "cpu" "memory" "temperature" "keyboard-state" "clock" ];
        "wlr/workspaces" = {
          "format" = "{icon}";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "4" = "󰭹";
            "5" = "";
            "urgent" = "";
            "focused" = "";
            "default" = "";
          };
        };
        # "sway/workspaces"= {
        #     "disable-scroll"= true,
        #     "all-outputs"= true,
        #     "format"= "{name}: {icon}",
        #     "format-icons"= {
        #         "1"= "",
        #         "2"= "",
        #         "3"= "",
        #         "4"= "",
        #         "5"= "",
        #         "urgent"= "",
        #         "focused"= "",
        #         "default"= ""
        #     }
        # },
        "keyboard-state" = {
          "numlock" = true;
          "capslock" = true;
          "format" = "{icon} {name}";
          "format-icons" = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        "hyprland/window" = {
          "format" = "➡ {}";
          "separate-outputs" = true;
        };

        "mpd" = {
          "format" = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ⸨{songPosition}|{queueLength}⸩ {volume}% ";
          "format-disconnected" = "Disconnected ";
          "format-stopped" = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
          "unknown-tag" = "N/A";
          "interval" = 2;
          "consume-icons" = {
            "on" = " ";
          };
          "random-icons" = {
            "off" = "<span color=\"#f53c3c\"></span> ";
            "on" = " ";
          };
          "repeat-icons" = {
            "on" = " ";
          };
          "single-icons" = {
            "on" = "1 ";
          };
          "state-icons" = {
            "paused" = "";
            "playing" = "";
          };
          "tooltip-format" = "MPD (connected)";
          "tooltip-format-disconnected" = "MPD (disconnected)";
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = "";
            "deactivated" = "";
          };
        };
        "tray" = {
          # "icon-size"= 21;
          "spacing" = 10;
        };
        "clock" = {
          # "timezone"= "America/New_York";
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
        "cpu" = {
          "format" = " {usage}%";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}% ";
        };
        "temperature" = {
          # "thermal-zone"= 2,
          # "hwmon-path"= "/sys/class/hwmon/hwmon2/temp1_input",
          "critical-threshold" = 80;
          # "format-critical"= "{temperatureC}°C {icon}";
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = [ "" "" "" ];
        };
        "backlight" = {
          # "device"= "acpi_video1";
          "format" = "{percent}% {icon}";
          "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
        };
        "battery" = {
          "states" = {
            # "good"= 95;
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% ";
          "format-plugged" = "{capacity}% ";
          "format-alt" = "{time} {icon}";
          # "format-good"= "", # An empty format will hide the module
          # "format-full"= "";
          "format-icons" = [ "" "" "" "" "" ];
        };
        "battery\#bat2" = {
          "bat" = "BAT2";
        };
        "network" = {
          # "interface"= "wlp2*", # (Optional) To force the use of this interface
          "format-wifi" = " {essid} ({signalStrength}%)";
          "format-ethernet" = " {ipaddr}/{cidr}";
          "tooltip-format" = " {ifname} via {gwaddr}";
          "format-linked" = " {ifname} (No IP)";
          "format-disconnected" = "⚠ Disconnected";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          # "scroll-step"= 1, // %, can be a float
          "format" = "{icon}  {volume}%   {format_source}";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = " {format_source}";
          "format-source" = " {volume}%";
          "format-source-muted" = "";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = [ "" "" "" ];
          };
          "on-click" = "pavucontrol";
        };
      };
    };
    services.mako = {
      enable = true;
      defaultTimeout = 10000;
    };
    programs.foot.enable = true;
    programs.yazi = {
      enable = true;
      enableFishIntegration = true;
    };
    services.cliphist.enable = true;
    programs.fish.enable = true;
    xdg.configFile."hypr/frappe.conf".text = ''
      $rosewaterAlpha = fff5e0dc
      $flamingoAlpha  = fff2cdcd
      $pinkAlpha      = fff5c2e7
      $mauveAlpha     = ffcba6f7
      $redAlpha       = fff38ba8
      $maroonAlpha    = ffeba0ac
      $peachAlpha     = fffab387
      $yellowAlpha    = fff9e2af
      $greenAlpha     = ffa6e3a1
      $tealAlpha      = ff94e2d5
      $skyAlpha       = ff89dceb
      $sapphireAlpha  = ff74c7ec
      $blueAlpha      = ff89b4fa
      $lavenderAlpha  = ffb4befe

      $textAlpha      = ffcdd6f4
      $subtext1Alpha  = ffbac2de
      $subtext0Alpha  = ffa6adc8

      $overlay2Alpha  = ff9399b2
      $overlay1Alpha  = ff7f849c
      $overlay0Alpha  = ff6c7086

      $surface2Alpha  = ff585b70
      $surface1Alpha  = ff45475a
      $surface0Alpha  = ff313244

      $baseAlpha      = ff1e1e2e
      $mantleAlpha    = ff181825
      $crustAlpha     = ff11111b

      $rosewater = 0xfff5e0dc
      $flamingo  = 0xfff2cdcd
      $pink      = 0xfff5c2e7
      $mauve     = 0xffcba6f7
      $red       = 0xfff38ba8
      $maroon    = 0xffeba0ac
      $peach     = 0xfffab387
      $yellow    = 0xfff9e2af
      $green     = 0xffa6e3a1
      $teal      = 0xff94e2d5
      $sky       = 0xff89dceb
      $sapphire  = 0xff74c7ec
      $blue      = 0xff89b4fa
      $lavender  = 0xffb4befe

      $text      = 0xffcdd6f4
      $subtext1  = 0xffbac2de
      $subtext0  = 0xffa6adc8

      $overlay2  = 0xff9399b2
      $overlay1  = 0xff7f849c
      $overlay0  = 0xff6c7086

      $surface2  = 0xff585b70
      $surface1  = 0xff45475a
      $surface0  = 0xff313244

      $base      = 0xff1e1e2e
      $mantle    = 0xff181825
      $crust     = 0xff11111b
    '';
  };
}
