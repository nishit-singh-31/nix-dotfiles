{ pkgs, lib, ... }:

{
  home.file.".config/kitty/kitty.conf".text = ''
  # vim:ft=kitty

  # The basic colors
  foreground              #fbf1c7
  background              #282828
  selection_foreground    #928374
  selection_background    #7c6f64

  # Transparent Background
  background_opacity 0.85

  # Cursor colors
  cursor                  #d65d0e
  cursor_text_color       #ebdbb2

  # URL underline color when hovering with mouse
  url_color               #f8cce9

  # kitty window border colors
  active_border_color     #504945
  inactive_border_color   #3c3836
  bell_border_color       #ebdbb2

  # OS Window titlebar colors
  wayland_titlebar_color system
  macos_titlebar_color system

  #: Tab bar colors
  active_tab_foreground   #ebdbb2
  active_tab_background   #3c3836
  inactive_tab_foreground #d5c5a1
  inactive_tab_background #32302f
  tab_bar_background      #282828

  # Colors for marks (marked text in the terminal)

  mark1_foreground #d3868b
  mark1_background #665c51
  mark2_foreground #8ec07f
  mark2_background #504948
  mark3_foreground #83a599
  mark3_background #929374

  #: The 16 terminal colors

  #: black
  color0 #282828
  color8 #928374

  #: red
  color1 #cc241d
  color9 #fb4934

  #: green
  color2  #98971a
  color10 #b8bb26

  #: yellow
  color3  #d79921
  color11 #fabd2f

  #: blue
  color4  #458588
  color12 #83a598

  #: magenta
  color5  #b16286
  color13 #d3869b

  #: cyan
  color6  #689d6a
  color14 #8ec07c

  #: white
  color7  #a89984
  color15 #ebdbb2

  #|-window-decorations-|#
  window_padding_width 4

  #|-------font---------|#
  font_family terminus
  bold_font auto
  italic_font auto
  bold_italic_font auto

  font_size 12

  #-------scroll-------|#
  map shift+up         scroll_line_up
  map shift+page_up    scroll_page_up
  map shift+down       scroll_line_down
  map shift+page_down  scroll_page_down

  #|--------misc-------|#
  disable_ligatures never
  open_url_with firefox
  copy_on_select yes

  '';
}

