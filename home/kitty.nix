{...}: {
  programs.kitty = {
    enable = true;
    extraConfig = ''
         include /home/shot/.config/kitty/theme.conf
      include /home/shot/.config/kitty/font.conf
            window_padding_width 4
            enable_audio_bell no
    '';
  };
  home.file.".config/kitty/themes/light.conf" = {
    text = ''
      ## name: Alabaster Custom
      ## author: Nicolai Verbaarschot
      ## license: MIT
      ## upstream: https://raw.githubusercontent.com/anmolmathias/kitty-alabaster/master/alabaster.conf
      ## blurb: A light color scheme adapted from Alabaster for the kitty terminal.

      #: The basic colors

      foreground              #000000
      background              #ffffff

      selection_foreground    #000000
      selection_background    #bfdbfe


      #: Cursor colors

      cursor                  #007acc
      cursor_text_color       #bfdbfe


      #: URL underline color when hovering with mouse

      url_color               #325cc0


      #: The basic 16 colors

      #: black
      color0                  #000000
      color8                  #777777

      #: red
      color1                  #aa3731
      color9                  #f05050

      #: green
      color2                  #448c37
      color10                 #60cb00

      #: yellow
      color3                  #cb9000
      color11                 #ffbc5d

      #: blue
      color4                  #325cc0
      color12                 #007acc

      #: magenta
      color5                  #7a3e9d
      color13                 #e64ce6

      #: cyan
      color6                  #0083b2
      color14                 #00aacb

      #: white
      color7                  #f7f7f7
      color15                 #f7f7f7


      #: kitty window border colors and terminal bell colors

      active_border_color             #777777
      inactive_border_color           #cccccc
      bell_border_color               #e97e57


      #: Tab bar colors

      active_tab_foreground           #000000
      active_tab_background           #f7f7f7
      inactive_tab_foreground         #444444
      inactive_tab_background         #dedede
    '';
  };
  home.file.".config/kitty/themes/dark.conf" = {
    text = ''
      ## name: Alabaster Dark Custom
      ## author: Nicolai Verbaarschot
      ## license: MIT
      ## upstream: https://raw.githubusercontent.com/anmolmathias/kitty-alabaster/master/alabaster-dark.conf
      ## blurb: A dark color scheme adapted from Alabaster for the kitty terminal.

      #: The basic colors

      foreground              #cecece
      background              #000000

      selection_foreground    #cecece
      selection_background    #293334


      #: Cursor colors

      cursor                  #cd974b
      cursor_text_color       #000000


      #: URL underline color when hovering with mouse

      url_color               #cd974b


      #: The basic 16 colors

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


      #: kitty window border colors and terminal bell colors

      active_border_color             #777777
      inactive_border_color           #323738
      bell_border_color               #e97e57


      #: Tab bar colors

      active_tab_foreground           #cecece
      active_tab_background           #0e1415
      inactive_tab_foreground         #b8b8b8
      inactive_tab_background         #323738
    '';
  };
}
