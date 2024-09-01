{ inputs, config, lib, pkgs, userSettings, systemSettings, ... }:

{
  home.packages = (with pkgs; [
    hyprland-protocols
    kitty
    waybar
    hyprpaper
    hyprcursor
    bibata-cursors
    grim
    slurp
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    feh
    killall
    dunst
    rofi-wayland
    wl-clipboard
    xfce.thunar
  ]);


  wayland.windowManager.hyprland = {
    enable = true;
    settings = { };
    extraConfig = ''

    # ---- GENERAL ---- #
    monitor=eDP-1,1920x1080@60.00Hz,0x0,1
    
    $term = kitty
    $menu = rofi -show drun
    $fileM = thuanr
    $fileT = kitty ranger
    $chat = vesktop

    exec-once = waybar & hyprpaper
    exec-once = hyprctl setcursor Bibata-Modern-Classic 15
    exec-once = dunst
    
    input {
      kb_layout = us
      follow_mouse = 1
      sensitivity = 0
      touchpad {
        natural_scroll = false
      }
    }

    gestures {
      workspace_swipe = false
    }

    device { 
      name = epic-mouse-v1
      sensitivity = 0
    }

    # ---- COLORS ---- #
    general {
      gaps_in = 2
      gaps_out = 5

      border_size = 0

      col.active_border = rgba(00000000)
      col.inactive_border = rgba(595959aa)

      resize_on_border = false

      allow_tearing = false

      layout = dwindle
    }

    decoration {
      rounding = 5

      active_opacity = 1.0
      inactive_opacity = 0.90

      drop_shadow = true
      shadow_range = 4
      shadow_render_power = 3
      col.shadow = rgba(1a1a1aee)

      blur {
        enabled = true
        size = 3
        passes = 3
        new_optimizations = true
        popups = false
        vibrancy = 0.1696
      }
    }
    
    animations {
      enabled = true
      bezier = myBezier, 0.05, 0.9, 0.1, 1.05

      animation = windows, 1, 7, myBezier
      animation = windowsOut, 1, 7, default, popin 80%
      animation = border, 1, 10, default
      animation = borderangle, 1, 8, default
      animation = fade, 1, 7, default
      animation = workspaces, 1, 6, default
    }

    dwindle { 
    pseudotile = true
    preserve_split = true
    }

    master {
    new_status = master
    }

    misc { 
    force_default_wallpaper = 0
    disable_hyprland_logo = true
    }
    
    # ---- ENV ---- #
    env = XDG_CURRENT_DESKTOP,Hyprland
    env = XDG_SESSION_DESKTOP,Hyprland
    env = XDG_SESSION_TYPE,wayland
    env = XCURSOR_SIZE,14
    env = HYPRCURSOR_SIZE,14

    # ---- RULES ---- #
    windowrulev2 = suppressevent maximize, class:.*
    windowrulev2 = opacity 0.0 override, class:.^(xwaylandvideobridge)$
    windowrulev2 = noanim, class:.^(xwaylandvideobridge)$
    windowrulev2 = noinitialfocus, class:.^(xwaylandvideobridge)$
    windowrulev2 = maxsize 1 1, class:.^(xwaylandvideobridge)$
    windowrulev2 = maxsize 1 1, class:.^(xwaylandvideobridge)$
    windowrule = float, an-anime-game-launcher
    windowrule = float, the-honkers-railway-launcher
    windowrule = float, sleepy-launcher
    windowrule = float, feh

    # ---- KEYBINDS ---- #
    $mainMod = SUPER

    bind = $mainMod, Q, killactive,
    bind = $mainMod SHIFT, Q, exit,
    bind = $mainMod, V, togglefloating,
    bind = $mainMod, R, pseudo,
    bind = $mainMod, J, togglesplit,
    bind = $mainMod SHIFT, C, exec, killall waybar && waybar

    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    bind = $mainMod, RETURN, exec, $term
    bind = $mainMod, E, exec, $fileM
    bind = $mainMod, R, exec, $fileT
    bind = $mainMod, P, exec, $menu
    bind = $mainMod, D, exec, $chat
    bind = $mainMod, B, exec, librewolf
    bind = $mainMod, S, exec, steam

    bind = $mainMod, F, exec, grim -g "$(slurp)" - | wl-copy
    bind = $mainMod SHIFT, F, exec, grim -g "$(slurp)" $(HOME/media/pictures/ss)/$(date +'%s_grim.png')

    '';
    xwayland = { enable = true; };
    systemd.enable = true;
  };
  
  home.file.".config/hypr/hyprpaper.conf".text = ''
    preload = /home/nishit/media/pictures/wallpapers/gruvbox/road.png
    wallpaper = eDP-1, /home/nishit/media/pictures/wallpapers/gruvbox/road.png
  '';
}
