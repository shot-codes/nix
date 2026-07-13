{...}: {
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "svelte"
    ];
    userSettings = {
      theme = {
        mode = "system";
        dark = "Alabaster Dark";
        light = "Alabaster Light";
      };
      vim_mode = true;
      ui_font_family = "Iosevka";
      ui_font_size = 16;
      agent_ui_font_size = 16;
      agent_buffer_font_size = 14;
      buffer_font_family = "Iosevka";
      buffer_font_size = 14;
    };
    userKeymaps = [
      {
        context = "vim_mode == insert";
        bindings = {
          "j k" = "vim::NormalBefore";
          "space t" = null; # Explicitly unbind space t in insert mode
        };
      }
      {
        context = "VimControl && vim_mode == normal && !menu";
        bindings = {
          "space t" = "project_panel::ToggleFocus";
        };
      }
      {
        context = "ProjectPanel";
        bindings = {
          "j" = "menu::SelectNext";
          "k" = "menu::SelectPrevious";
          "l" = "project_panel::ExpandSelectedEntry";
          "h" = "project_panel::CollapseSelectedEntry";
          "enter" = "project_panel::Open";
          "escape" = "menu::Cancel";
          "space t" = "project_panel::ToggleFocus";
        };
      }
      {
        context = "VimControl && vim_mode == normal && !menu";
        bindings = {
          "space t" = "project_panel::ToggleFocus";
          "ctrl-j" = "pane::ActivatePreviousItem";
          "ctrl-k" = "pane::ActivateNextItem";
          "space w" = "pane::CloseActiveItem";
        };
      }
      {
        context = "Terminal";
        bindings = {
          "ctrl-j" = "pane::ActivatePreviousItem";
          "ctrl-k" = "pane::ActivateNextItem";
          "space t" = "project_panel::ToggleFocus";
        };
      }
      {
        context = "EmptyPane || SharedScreen";
        bindings = {
          "space t" = "project_panel::ToggleFocus";
        };
      }
      # Supertab
      {
        context = "Picker > Editor";
        use_key_equivalents = true;
        bindings = {
          tab = "editor::ContextMenuNext";
          shift-tab = "editor::ContextMenuPrevious";
        };
      }
      {
        context = "Picker || menu";
        use_key_equivalents = true;
        bindings = {
          tab = "editor::ContextMenuNext";
          shift-tab = "editor::ContextMenuPrevious";
        };
      }
      {
        context = "(Editor && showing_completions)";
        use_key_equivalents = true;
        bindings = {
          enter = "editor::Newline";
          "ctrl-a" = "editor::ConfirmCompletion";
          tab = "editor::ContextMenuNext";
          shift-tab = "editor::ContextMenuPrevious";
        };
      }
      # {
      #   context = "Picker > Editor";
      #   use_key_equivalents = true;
      #   bindings = {
      #     tab = "editor::ContextMenuNext";
      #     shift-tab = "editor::ContextMenuPrevious";
      #   };
      # }
      # {
      #   context = "Picker || menu";
      #   use_key_equivalents = true;
      #   bindings = {
      #     tab = "editor::ContextMenuNext";
      #     shift-tab = "editor::ContextMenuPrevious";
      #   };
      # }
      # {
      #   context = "(Editor && showing_completions)";
      #   use_key_equivalents = true;
      #   bindings = {
      #     tab = "editor::ContextMenuNext";
      #     shift-tab = "editor::ContextMenuPrevious";
      #   };
      # }
    ];
  };
  home.file.".config/zed/themes/alabaster.json" = {
    text = ''
      {
        "$schema": "https://zed.dev/schema/themes/v0.2.0.json",
        "name": "Alabaster",
        "author": "shot.codes",
        "themes": [
          {
            "name": "Alabaster Light",
            "appearance": "light",
            "style": {
              "border": "#c9c9caff",
              "border.variant": "#dfdfe0ff",
              "border.focused": "#7d82e8ff",
              "border.selected": "#cbcdf6ff",
              "border.transparent": "#00000000",
              "border.disabled": "#d3d3d4ff",
              "elevated_surface.background": "#F0F0F0FF",
              "surface.background": "#F0F0F0FF",
              "background": "#F0F0F0FF",
              "element.background": "#ebebecff",
              "element.hover": "#EBEBEBFF",
              "element.active": "#DBDBDBFF",
              "element.selected": "#DEDEDEFF",
              "element.disabled": "#ebebecff",
              "drop_target.background": "#7e808780",
              "ghost_element.background": "#00000000",
              "ghost_element.hover": "#dfdfe0ff",
              "ghost_element.active": "#DBDBDBFF",
              "ghost_element.selected": "#DEDEDEFF",
              "ghost_element.disabled": "#ebebecff",
              "text": "#242529ff",
              "text.muted": "#58585aff",
              "text.placeholder": "#7e8086ff",
              "text.disabled": "#7e8086ff",
              "text.accent": "#5c78e2ff",
              "icon": "#242529ff",
              "icon.muted": "#58585aff",
              "icon.disabled": "#7e8086ff",
              "icon.placeholder": "#58585aff",
              "icon.accent": "#5c78e2ff",
              "status_bar.background": "#F0F0F0FF",
              "title_bar.background": "#F0F0F0FF",
              "title_bar.inactive_background": "#F0F0F0FF",
              "toolbar.background": "#FFFFFFFF",
              "tab_bar.background": "#F0F0F0FF",
              "tab.inactive_background": "#F0F0F0FF",
              "tab.active_background": "#FFFFFFFF",
              "search.match_background": "#5c79e266",
              "search.active_match_background": "#d0a92366",
              "panel.background": "#F0F0F0FF",
              "panel.focused_border": "#7d82e8ff",
              "pane.focused_border": "#7d82e8ff",
              "scrollbar.thumb.background": "#383a414c",
              "scrollbar.thumb.hover_background": "#dfdfe0ff",
              "scrollbar.thumb.border": "#dfdfe0ff",
              "scrollbar.track.background": "#00000000",
              "scrollbar.track.border": "#eeeeeeff",
              "editor.foreground": "#242529ff",
              "editor.background": "#FFFFFFFF",
              "editor.gutter.background": "#FFFFFFFF",
              "editor.subheader.background": "#F0F0F0FF",
              "editor.active_line.background": "#ebebecbf",
              "editor.highlighted_line.background": "#F0F0F0FF",
              "editor.line_number": "#BDBDBDFF",
              "editor.active_line_number": "#4A4A4AFF",
              "editor.hover_line_number": "#6B6B6BFF",
              "editor.invisible": "#a3a3a4ff",
              "editor.wrap_guide": "#383a410d",
              "editor.active_wrap_guide": "#383a411a",
              "editor.document_highlight.read_background": "#5c78e225",
              "editor.document_highlight.write_background": "#a3a3a466",
              "terminal.background": "#FFFFFFFF",
              "terminal.foreground": "#2a2c33ff",
              "terminal.bright_foreground": "#2a2c33ff",
              "terminal.dim_foreground": "#bbbbbbff",
              "terminal.ansi.black": "#000000ff",
              "terminal.ansi.bright_black": "#000000ff",
              "terminal.ansi.dim_black": "#555555ff",
              "terminal.ansi.red": "#de3e35ff",
              "terminal.ansi.bright_red": "#de3e35ff",
              "terminal.ansi.dim_red": "#9c2b26ff",
              "terminal.ansi.green": "#3f953aff",
              "terminal.ansi.bright_green": "#3f953aff",
              "terminal.ansi.dim_green": "#2b6927ff",
              "terminal.ansi.yellow": "#d2b67cff",
              "terminal.ansi.bright_yellow": "#d2b67cff",
              "terminal.ansi.dim_yellow": "#a48c5aff",
              "terminal.ansi.blue": "#2f5af3ff",
              "terminal.ansi.bright_blue": "#2f5af3ff",
              "terminal.ansi.dim_blue": "#2140abff",
              "terminal.ansi.magenta": "#950095ff",
              "terminal.ansi.bright_magenta": "#a00095ff",
              "terminal.ansi.dim_magenta": "#6a006aff",
              "terminal.ansi.cyan": "#3f953aff",
              "terminal.ansi.bright_cyan": "#3f953aff",
              "terminal.ansi.dim_cyan": "#2b6927ff",
              "terminal.ansi.white": "#bbbbbbff",
              "terminal.ansi.bright_white": "#ffffffff",
              "terminal.ansi.dim_white": "#888888ff",
              "link_text.hover": "#5c78e2ff",
              "version_control.added": "#27a657ff",
              "version_control.modified": "#d3b020ff",
              "version_control.word_added": "#2EA04859",
              "version_control.word_deleted": "#F85149CC",
              "version_control.deleted": "#e06c76ff",
              "conflict": "#a48819ff",
              "conflict.background": "#faf2e6ff",
              "conflict.border": "#f4e7d1ff",
              "created": "#669f59ff",
              "created.background": "#dfeadbff",
              "created.border": "#c8dcc1ff",
              "deleted": "#d36151ff",
              "deleted.background": "#fbdfd9ff",
              "deleted.border": "#f6c6bdff",
              "error": "#d36151ff",
              "error.background": "#fbdfd9ff",
              "error.border": "#f6c6bdff",
              "hidden": "#7e8086ff",
              "hidden.background": "#dcdcddff",
              "hidden.border": "#d3d3d4ff",
              "hint": "#7274a7ff",
              "hint.background": "#e2e2faff",
              "hint.border": "#cbcdf6ff",
              "ignored": "#7e8086ff",
              "ignored.background": "#dcdcddff",
              "ignored.border": "#c9c9caff",
              "info": "#4082C9FF",
              "info.background": "#e2e2faff",
              "info.border": "#cbcdf6ff",
              "modified": "#a48819ff",
              "modified.background": "#faf2e6ff",
              "modified.border": "#f4e7d1ff",
              "predictive": "#9b9ec6ff",
              "predictive.background": "#dfeadbff",
              "predictive.border": "#c8dcc1ff",
              "renamed": "#5c78e2ff",
              "renamed.background": "#e2e2faff",
              "renamed.border": "#cbcdf6ff",
              "success": "#669f59ff",
              "success.background": "#dfeadbff",
              "success.border": "#c8dcc1ff",
              "unreachable": "#58585aff",
              "unreachable.background": "#dcdcddff",
              "unreachable.border": "#c9c9caff",
              "warning": "#a48819ff",
              "warning.background": "#faf2e6ff",
              "warning.border": "#f4e7d1ff",
              "players": [
                {
                  "cursor": "#5c78e2ff",
                  "background": "#5c78e2ff",
                  "selection": "#5c78e23d"
                },
                {
                  "cursor": "#984ea5ff",
                  "background": "#984ea5ff",
                  "selection": "#984ea53d"
                },
                {
                  "cursor": "#ad6e26ff",
                  "background": "#ad6e26ff",
                  "selection": "#ad6e263d"
                },
                {
                  "cursor": "#a349abff",
                  "background": "#a349abff",
                  "selection": "#a349ab3d"
                },
                {
                  "cursor": "#3a82b7ff",
                  "background": "#3a82b7ff",
                  "selection": "#3a82b73d"
                },
                {
                  "cursor": "#d36151ff",
                  "background": "#d36151ff",
                  "selection": "#d361513d"
                },
                {
                  "cursor": "#a48819ff",
                  "background": "#dec184ff",
                  "selection": "#dec1843d"
                },
                {
                  "cursor": "#669f59ff",
                  "background": "#669f59ff",
                  "selection": "#669f593d"
                }
              ],
              "syntax": {
                "attribute": {
                  "color": "#3D3D3DFF",
                  "font_style": null,
                  "font_weight": null
                },
                "boolean": {
                  "color": "#BF6300FF",
                  "font_style": null,
                  "font_weight": null
                },
                "comment": {
                  "color": "#9E9E9EFF",
                  "font_style": null,
                  "font_weight": null
                },
                "comment.doc": {
                  "color": "#9E9E9EFF",
                  "font_style": null,
                  "font_weight": null
                },
                "constant": {
                  "color": "#BF6300FF",
                  "font_style": null,
                  "font_weight": null
                },
                "constructor": {
                  "color": "#0039FFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "embedded": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis": {
                  "color": "#5c78e2ff",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis.strong": {
                  "color": "#ad6e25ff",
                  "font_style": null,
                  "font_weight": 700
                },
                "enum": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "function": {
                  "color": "#002CD9FF",
                  "font_style": null,
                  "font_weight": null
                },
                "hint": {
                  "color": "#7274a7ff",
                  "font_style": null,
                  "font_weight": null
                },
                "keyword": {
                  "color": "#3D3D3DFF",
                  "font_style": null,
                  "font_weight": null
                },
                "label": {
                  "color": "#3D3D3DFF",
                  "font_style": null,
                  "font_weight": null
                },
                "link_text": {
                  "color": "#5b79e3ff",
                  "font_style": "italic",
                  "font_weight": null
                },
                "link_uri": {
                  "color": "#3882b7ff",
                  "font_style": null,
                  "font_weight": null
                },
                "namespace": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "number": {
                  "color": "#BF6300FF",
                  "font_style": null,
                  "font_weight": null
                },
                "operator": {
                  "color": "#3D3D3DFF",
                  "font_style": null,
                  "font_weight": null
                },
                "predictive": {
                  "color": "#9b9ec6ff",
                  "font_style": "italic",
                  "font_weight": null
                },
                "preproc": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "primary": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "property": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.bracket": {
                  "color": "#3D3D3DFF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.delimiter": {
                  "color": "#3D3D3DFF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.list_marker": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.markup": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.special": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "selector": {
                  "color": "#669f59ff",
                  "font_style": null,
                  "font_weight": null
                },
                "selector.pseudo": {
                  "color": "#5c78e2ff",
                  "font_style": null,
                  "font_weight": null
                },
                "string": {
                  "color": "#1A8A00FF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.escape": {
                  "color": "#7A7A7AFF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.regex": {
                  "color": "#4FBD33FF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special": {
                  "color": "#4FBD33FF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special.symbol": {
                  "color": "#4FBD33FF",
                  "font_style": null,
                  "font_weight": null
                },
                "tag": {
                  "color": "#5c78e2ff",
                  "font_style": null,
                  "font_weight": null
                },
                "text.literal": {
                  "color": "#4FBD33FF",
                  "font_style": null,
                  "font_weight": null
                },
                "title": {
                  "color": "#d3604fff",
                  "font_style": null,
                  "font_weight": 400
                },
                "type": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "variable": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "variable.special": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                },
                "variant": {
                  "color": "#000000FF",
                  "font_style": null,
                  "font_weight": null
                }
              },
              "panel.overlay_background": "#F0F0F0FF",
              "panel.overlay_hover": "#F0F0F0FF",
              "minimap.thumb.background": "#383a414c",
              "minimap.thumb.hover_background": "#dfdfe0ff",
              "minimap.thumb.border": "#dfdfe0ff",
              "version_control.renamed": "#5c78e2ff",
              "version_control.conflict": "#a48819ff",
              "version_control.ignored": "#7e8086ff"
            }
          },
          {
            "name": "Alabaster Dark",
            "appearance": "dark",
            "style": {
              "border": "#242424FF",
              "border.variant": "#2E2E2EFF",
              "border.focused": "#969696FF",
              "border.selected": "#9E9E9EFF",
              "border.transparent": "#00000000",
              "border.disabled": "#575757FF",
              "elevated_surface.background": "#0D0D0DFF",
              "surface.background": "#0D0D0DFF",
              "background": "#0D0D0DFF",
              "element.background": "#1A1A1AFF",
              "element.hover": "#1A1A1AFF",
              "element.active": "#262626FF",
              "element.selected": "#1F1F1FFF",
              "element.disabled": "#383838FF",
              "drop_target.background": "#8F8F8F80",
              "ghost_element.background": "#00000000",
              "ghost_element.hover": "#1A1A1AFF",
              "ghost_element.active": "#262626FF",
              "ghost_element.selected": "#1F1F1FFF",
              "ghost_element.disabled": "#3D3D3DFF",
              "text": "#C9C9C9FF",
              "text.muted": "#737373FF",
              "text.placeholder": "#999999FF",
              "text.disabled": "#616161FF",
              "text.accent": "#E0E0E0FF",
              "icon": "#C9C9C9FF",
              "icon.muted": "#737373FF",
              "icon.disabled": "#616161FF",
              "icon.placeholder": "#a9afbcff",
              "icon.accent": "#E0E0E0FF",
              "status_bar.background": "#0D0D0DFF",
              "title_bar.background": "#0D0D0DFF",
              "title_bar.inactive_background": "#0D0D0DFF",
              "toolbar.background": "#000000FF",
              "tab_bar.background": "#0D0D0DFF",
              "tab.inactive_background": "#0D0D0DFF",
              "tab.active_background": "#000000FF",
              "search.match_background": "#74ade866",
              "search.active_match_background": "#e8af7466",
              "panel.background": "#0D0D0DFF",
              "panel.focused_border": "#969696FF",
              "pane.focused_border": "#969696FF",
              "scrollbar.thumb.background": "#c8ccd44c",
              "scrollbar.thumb.hover_background": "#3B3B3BFF",
              "scrollbar.thumb.border": "#454545FF",
              "scrollbar.track.background": "#00000000",
              "scrollbar.track.border": "#383838FF",
              "editor.foreground": "#acb2beff",
              "editor.background": "#000000FF",
              "editor.gutter.background": "#000000FF",
              "editor.subheader.background": "#0D0D0DFF",
              "editor.active_line.background": "#1C1C1CBF",
              "editor.highlighted_line.background": "#0D0D0DFF",
              "editor.line_number": "#4e5a5f",
              "editor.active_line_number": "#d0d4da",
              "editor.hover_line_number": "#acb0b4",
              "editor.invisible": "#878a98ff",
              "editor.wrap_guide": "#c8ccd40d",
              "editor.active_wrap_guide": "#c8ccd41a",
              "editor.document_highlight.read_background": "#74ade81a",
              "editor.document_highlight.write_background": "#555a6366",
              "terminal.background": "#000000ff",
              "terminal.foreground": "#abb2bfff",
              "terminal.bright_foreground": "#dce0e5ff",
              "terminal.dim_foreground": "#636d83ff",
              "terminal.ansi.black": "#282c34ff",
              "terminal.ansi.bright_black": "#636d83ff",
              "terminal.ansi.dim_black": "#3b3f4aff",
              "terminal.ansi.red": "#e06c75ff",
              "terminal.ansi.bright_red": "#EA858Bff",
              "terminal.ansi.dim_red": "#a7545aff",
              "terminal.ansi.green": "#98c379ff",
              "terminal.ansi.bright_green": "#AAD581ff",
              "terminal.ansi.dim_green": "#6d8f59ff",
              "terminal.ansi.yellow": "#e5c07bff",
              "terminal.ansi.bright_yellow": "#FFD885ff",
              "terminal.ansi.dim_yellow": "#b8985bff",
              "terminal.ansi.blue": "#61afefff",
              "terminal.ansi.bright_blue": "#85C1FFff",
              "terminal.ansi.dim_blue": "#457cadff",
              "terminal.ansi.magenta": "#c678ddff",
              "terminal.ansi.bright_magenta": "#D398EBff",
              "terminal.ansi.dim_magenta": "#8d54a0ff",
              "terminal.ansi.cyan": "#56b6c2ff",
              "terminal.ansi.bright_cyan": "#6ED5DEff",
              "terminal.ansi.dim_cyan": "#3c818aff",
              "terminal.ansi.white": "#abb2bfff",
              "terminal.ansi.bright_white": "#fafafaff",
              "terminal.ansi.dim_white": "#8f969bff",
              "link_text.hover": "#E0E0E0FF",
              "version_control.added": "#27a657ff",
              "version_control.modified": "#d3b020ff",
              "version_control.word_added": "#2EA04859",
              "version_control.word_deleted": "#78081BCC",
              "version_control.deleted": "#e06c76ff",
              "version_control.conflict_marker.ours": "#a1c1811a",
              "version_control.conflict_marker.theirs": "#74ade81a",
              "conflict": "#dec184ff",
              "conflict.background": "#dec1841a",
              "conflict.border": "#5d4c2fff",
              "created": "#a1c181ff",
              "created.background": "#a1c1811a",
              "created.border": "#38482fff",
              "deleted": "#d07277ff",
              "deleted.background": "#d072771a",
              "deleted.border": "#4c2b2cff",
              "error": "#d07277ff",
              "error.background": "#d072771a",
              "error.border": "#4c2b2cff",
              "hidden": "#878a98ff",
              "hidden.background": "#696b771a",
              "hidden.border": "#414754ff",
              "hint": "#788ca6ff",
              "hint.background": "#5a6f891a",
              "hint.border": "#293b5bff",
              "ignored": "#878a98ff",
              "ignored.background": "#696b771a",
              "ignored.border": "#464b57ff",
              "info": "#74ade8ff",
              "info.background": "#74ade81a",
              "info.border": "#293b5bff",
              "modified": "#dec184ff",
              "modified.background": "#dec1841a",
              "modified.border": "#5d4c2fff",
              "predictive": "#5a6a87ff",
              "predictive.background": "#5a6a871a",
              "predictive.border": "#38482fff",
              "renamed": "#74ade8ff",
              "renamed.background": "#74ade81a",
              "renamed.border": "#293b5bff",
              "success": "#a1c181ff",
              "success.background": "#a1c1811a",
              "success.border": "#38482fff",
              "unreachable": "#a9afbcff",
              "unreachable.background": "#8389941a",
              "unreachable.border": "#464b57ff",
              "warning": "#dec184ff",
              "warning.background": "#dec1841a",
              "warning.border": "#5d4c2fff",
              "players": [
                {
                  "cursor": "#74ade8ff",
                  "background": "#74ade8ff",
                  "selection": "#74ade83d"
                },
                {
                  "cursor": "#be5046ff",
                  "background": "#be5046ff",
                  "selection": "#be50463d"
                },
                {
                  "cursor": "#bf956aff",
                  "background": "#bf956aff",
                  "selection": "#bf956a3d"
                },
                {
                  "cursor": "#b477cfff",
                  "background": "#b477cfff",
                  "selection": "#b477cf3d"
                },
                {
                  "cursor": "#6eb4bfff",
                  "background": "#6eb4bfff",
                  "selection": "#6eb4bf3d"
                },
                {
                  "cursor": "#d07277ff",
                  "background": "#d07277ff",
                  "selection": "#d072773d"
                },
                {
                  "cursor": "#dec184ff",
                  "background": "#dec184ff",
                  "selection": "#dec1843d"
                },
                {
                  "cursor": "#a1c181ff",
                  "background": "#a1c181ff",
                  "selection": "#a1c1813d"
                }
              ],
              "syntax": {
                "attribute": {
                  "color": "#B3B3B3FF",
                  "font_style": null,
                  "font_weight": null
                },
                "boolean": {
                  "color": "#FFDA66FF",
                  "font_style": null,
                  "font_weight": null
                },
                "comment": {
                  "color": "#FA7A7AFF",
                  "font_style": null,
                  "font_weight": null
                },
                "comment.doc": {
                  "color": "#FA7A7AFF",
                  "font_style": null,
                  "font_weight": null
                },
                "constant": {
                  "color": "#FFDA66FF",
                  "font_style": null,
                  "font_weight": null
                },
                "constructor": {
                  "color": "#7DBAFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "embedded": {
                  "color": "#dce0e5ff",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis": {
                  "color": "#74ade8ff",
                  "font_style": null,
                  "font_weight": null
                },
                "emphasis.strong": {
                  "color": "#bf956aff",
                  "font_style": null,
                  "font_weight": 700
                },
                "enum": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "function": {
                  "color": "#7DBAFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "hint": {
                  "color": "#788ca6ff",
                  "font_style": null,
                  "font_weight": null
                },
                "keyword": {
                  "color": "#B3B3B3FF",
                  "font_style": null,
                  "font_weight": null
                },
                "label": {
                  "color": "#74ade8ff",
                  "font_style": null,
                  "font_weight": null
                },
                "link_text": {
                  "color": "#73ade9ff",
                  "font_style": "normal",
                  "font_weight": null
                },
                "link_uri": {
                  "color": "#6eb4bfff",
                  "font_style": null,
                  "font_weight": null
                },
                "namespace": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "number": {
                  "color": "#FFDA66FF",
                  "font_style": null,
                  "font_weight": null
                },
                "operator": {
                  "color": "#B3B3B3FF",
                  "font_style": null,
                  "font_weight": null
                },
                "predictive": {
                  "color": "#5a6a87ff",
                  "font_style": "italic",
                  "font_weight": null
                },
                "preproc": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "primary": {
                  "color": "#acb2beff",
                  "font_style": null,
                  "font_weight": null
                },
                "property": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation": {
                  "color": "#acb2beff",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.bracket": {
                  "color": "#b2b9c6ff",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.delimiter": {
                  "color": "#b2b9c6ff",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.list_marker": {
                  "color": "#d07277ff",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.markup": {
                  "color": "#d07277ff",
                  "font_style": null,
                  "font_weight": null
                },
                "punctuation.special": {
                  "color": "#b1574bff",
                  "font_style": null,
                  "font_weight": null
                },
                "selector": {
                  "color": "#dfc184ff",
                  "font_style": null,
                  "font_weight": null
                },
                "selector.pseudo": {
                  "color": "#74ade8ff",
                  "font_style": null,
                  "font_weight": null
                },
                "string": {
                  "color": "#ADE874FF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.escape": {
                  "color": "#878e98ff",
                  "font_style": null,
                  "font_weight": null
                },
                "string.regex": {
                  "color": "#84CF44FF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special": {
                  "color": "#84CF44FF",
                  "font_style": null,
                  "font_weight": null
                },
                "string.special.symbol": {
                  "color": "#84CF44FF",
                  "font_style": null,
                  "font_weight": null
                },
                "tag": {
                  "color": "#74ade8ff",
                  "font_style": null,
                  "font_weight": null
                },
                "text.literal": {
                  "color": "#ADE874FF",
                  "font_style": null,
                  "font_weight": null
                },
                "title": {
                  "color": "#d07277ff",
                  "font_style": null,
                  "font_weight": 400
                },
                "type": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "variable": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "variable.special": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                },
                "variant": {
                  "color": "#FFFFFFFF",
                  "font_style": null,
                  "font_weight": null
                }
              },
              "panel.overlay_background": "#0D0D0DFF",
              "panel.overlay_hover": "#0D0D0DFF",
              "minimap.thumb.background": "#c8ccd44c",
              "minimap.thumb.hover_background": "#3B3B3BFF",
              "minimap.thumb.border": "#454545FF",
              "version_control.renamed": "#74ade8ff",
              "version_control.conflict": "#dec184ff",
              "version_control.ignored": "#878a98ff"
            }
          }
        ],
        "isUserGenerated": true,
        "description": "Alabaster Dark"
      }
    '';
  };
}
