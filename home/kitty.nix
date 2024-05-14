{...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
      window_padding_width 4
      enable_audio_bell no

      foreground              #cecece
      background              #000000
      selection_foreground    #cecece
      selection_background    #293334
      cursor                  #cd974b
      cursor_text_color       #000000
      url_color               #cd974b
      #: black
      color0                  #000000
      color8                  #777777
      #: red
      color1                  #e25d56
      color9                  #f36868
      #: green
      color2                  #73ca50
      color10                 #88db3f
      #: yellow
      color3                  #e9bf57
      color11                 #f0bf7a
      #: blue
      color4                  #4a88e4
      color12                 #6f8fdb
      #: magenta
      color5                  #915caf
      color13                 #e987e9
      #: cyan
      color6                  #23acdd
      color14                 #4ac9e2
      #: white
      color7                  #cecece
      color15                 #ffffff

      active_border_color             #777777
      inactive_border_color           #323738
      bell_border_color               #e97e57
      active_tab_foreground           #cecece
      active_tab_background           #0e1415
      inactive_tab_foreground         #b8b8b8
      inactive_tab_background         #323738
    '';
  };
}
