# XP-style window decorations: hyprbars title bars, a thin dark outer frame
# from borders-plus-plus, solid Luna-blue borders and opaque windows.
# Appended after hyprland.lua, so these hl.config calls override the base values.
{
  inputs,
  lib,
  pkgs,
  ...
}: let
  p = import ./palette.nix;
  c = p.luna;
  plugins = inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system};
  maximize = ''hyprctl dispatch 'hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })' '';
in {
  wayland.windowManager.hyprland = {
    plugins = [
      plugins.hyprbars
      plugins.borders-plus-plus
    ];

    extraConfig = lib.mkAfter ''

      ---------------- WINDOWS XP THEME (home/themes/xp) ----------------
      hl.config({
          general = {
              border_size = 4,
              col = {
                  active_border   = "rgb(${c.titleActive})",
                  inactive_border = "rgb(${c.titleInactive})",
              },
          },

          group = {
              col = {
                  border_active   = "rgb(${c.titleActive})",
                  border_inactive = "rgb(${c.titleInactive})",
              },
              groupbar = {
                  col = {
                      active   = "rgb(${c.titleActive})",
                      inactive = "rgb(${c.titleInactive})",
                  },
              },
          },

          decoration = {
              rounding         = 7,
              rounding_power   = 2.0,
              active_opacity   = 1.0,
              inactive_opacity = 1.0,
              shadow = {
                  enabled      = true,
                  range        = 8,
                  render_power = 3,
                  color        = 0x55000000,
              },
          },

          plugin = {
              hyprbars = {
                  bar_height                 = 28,
                  bar_color                  = "rgb(${c.titleActive})",
                  col = { text = "rgb(${c.titleText})" },
                  bar_text_font              = "${p.fonts.title}",
                  bar_text_weight            = "bold",
                  bar_text_size              = 11,
                  bar_text_align             = "left",
                  bar_padding                = 8,
                  bar_button_padding         = 3,
                  bar_part_of_window         = true,
                  bar_precedence_over_border = true,
                  inactive_button_color      = "rgb(${c.buttonInactive})",
                  on_double_click            = [[${maximize}]],
              },
              borders_plus_plus = {
                  add_borders      = 1,
                  natural_rounding = true,
                  border_size_1    = 1,
                  col = {
                      border_1 = "rgb(${c.frameDark})",
                  },
              },
          },
      })

      -- Buttons are laid out right to left: close, then maximise.
      hl.plugin.hyprbars.add_button({
          bg_color = "rgb(${c.close})",
          fg_color = "rgb(FFFFFF)",
          size     = 20,
          icon     = "✕",
          action   = "hyprctl dispatch 'hl.dsp.window.close()'",
      })
      hl.plugin.hyprbars.add_button({
          bg_color = "rgb(${c.button})",
          fg_color = "rgb(FFFFFF)",
          size     = 20,
          icon     = "□",
          action   = [[${maximize}]],
      })

      -- Unfocused windows get the faded XP title bar. Two named rules so the
      -- light/dark toggle (xp-toggle-theme) can switch between them.
      hl.window_rule({
          name    = "xp-inactive-luna",
          enabled = true,
          match   = { focus = false },
          ["hyprbars:bar_color"]   = "rgb(${c.titleInactive})",
          ["hyprbars:title_color"] = "rgb(${c.titleTextInactive})",
      })
      hl.window_rule({
          name    = "xp-inactive-noir",
          enabled = false,
          match   = { focus = false },
          ["hyprbars:bar_color"]   = "rgb(${p.royaleNoir.titleInactive})",
          ["hyprbars:title_color"] = "rgb(${p.royaleNoir.titleTextInactive})",
      })
    '';
  };
}
