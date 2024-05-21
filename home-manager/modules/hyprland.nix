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
      extraConfig = ''
        # Source a file (multi-file configs)
        source=~/.config/hypr/frappe.conf

        # Set programs that you use
        $terminal = foot
        $fileManager = foot fish -C yy
        $menu = wofi --show drun

        # See https://wiki.hyprland.org/Configuring/Keywords/ for more
        $mainMod = SUPER

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        bind = $mainMod, Q, killactive,
        bind = $mainMod, RETURN, exec, $terminal
        bind = $mainMod, APOSTROPHE, exec, $terminal
        bind = $mainMod SHIFT, Q, exit, 
        bind = $mainMod, E, exec, $fileManager
        bind = $mainMod, V, togglefloating, 
        bind = $mainMod, D, exec, $menu
        # bind = $mainMod, P, pseudo, # dwindle
        # bind = $mainMod, J, togglesplit, # dwindle
        bind = $mainMod, 0, exec, wlogout
        bindr = $mainMod, M, exec, pkill pavucontrol || pavucontrol
        bind = $mainMod, Y, exec, cliphist list | $menu -dmenu | cliphist decode | wl-copy
        bind = $mainMod, F, fullscreen 

        # misc
        # bind = $mainMod CTRL ALT, S, exec, xdg-open Pictures/1712470640_screen.png

        # Move focus with mainMod + arrow keys
        bind = $mainMod, left, movefocus, l
        bind = $mainMod, right, movefocus, r
        bind = $mainMod, up, movefocus, u
        bind = $mainMod, down, movefocus, d

        # Master-Layout bindings
        binde = $mainMod SHIFT, H, resizeactive, -30 0
        binde = $mainMod SHIFT, L, resizeactive,  30 0
        binde = $mainMod SHIFT, K, resizeactive,  0  30
        binde = $mainMod SHIFT, J, resizeactive,  0 -30
        binde = $mainMod, H, movefocus, l
        binde = $mainMod, L, movefocus, r
        binde = $mainMod, K, movefocus, u
        binde = $mainMod, J, movefocus, d
        bind = $mainMod CTRL, J, layoutmsg, swapwithmaster master

        # Screenshot bindings
        bind =,Print, exec, grim "$HOME/Pictures/$(date +'%s_screen.png')"
        bind = SHIFT, Print, exec, grim - | wl-copy
        #bind = SUPER, C, exec, grim -g "$(slurp)" "$HOME/Pictures/$(date +'%s_screen.png')"
        bind = SUPER SHIFT, Print, exec, grim -g "$(slurp)" - | wl-copy

        # Multimedia bindings
        binde =, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        binde =SUPER SHIFT CTRL, 4, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
        binde =, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        binde =SUPER SHIFT CTRL, 3, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        bind =, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        bind =, XF86AudioPlay, exec, playerctl play-pause
        bind =, XF86AudioPause, exec, playerctl play-pause
        bind =, XF86AudioNext, exec, playerctl next
        bind =, XF86AudioPrev, exec, playerctl previous

        # Switch workspaces with mainMod + [0-9]
        bind = $mainMod, 1, workspace, 1
        bind = $mainMod, 2, workspace, 2
        bind = $mainMod, 3, workspace, 3
        bind = $mainMod, 4, workspace, 4
        bind = $mainMod, 5, workspace, 5
        bind = $mainMod, 6, workspace, 6
        bind = $mainMod, 7, workspace, 7
        bind = $mainMod, 8, workspace, 8
        bind = $mainMod, 9, workspace, 9

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        bind = $mainMod SHIFT, 1, movetoworkspace, 1
        bind = $mainMod SHIFT, 2, movetoworkspace, 2
        bind = $mainMod SHIFT, 3, movetoworkspace, 3
        bind = $mainMod SHIFT, 4, movetoworkspace, 4
        bind = $mainMod SHIFT, 5, movetoworkspace, 5
        bind = $mainMod SHIFT, 6, movetoworkspace, 6
        bind = $mainMod SHIFT, 7, movetoworkspace, 7
        bind = $mainMod SHIFT, 8, movetoworkspace, 8
        bind = $mainMod SHIFT, 9, movetoworkspace, 9

        # Example special workspace (scratchpad)
        bind = $mainMod, S, togglespecialworkspace, magic
        bind = $mainMod CTRL, S, togglespecialworkspace, magic
        bind = $mainMod SHIFT, S, movetoworkspace, special:magic

        # Scroll through existing workspaces with mainMod + scroll
        bind = $mainMod, mouse_down, workspace, e+1
        bind = $mainMod, mouse_up, workspace, e-1

        # Move/resize windows with mainMod + LMB/RMB and dragging
        bindm = $mainMod, mouse:272, movewindow
        bindm = $mainMod, mouse:273, resizewindow
      '';
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
    programs.waybar.enable = true;
    services.mako.enable = true;
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
