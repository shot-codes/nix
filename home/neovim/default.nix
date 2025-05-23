# Todos
# - auto-complete super tab not working in some languages
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./completion.nix
    ./keymaps.nix
  ];
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    colorscheme = "alabaster";
    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      shiftwidth = 4;
      expandtab = true;
      tabstop = 4;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "yes";
      wrap = false;
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "alabaster";
        src = pkgs.fetchFromGitHub {
          owner = "shot-codes";
          repo = "alabaster.nvim";
          rev = "f2163e98b75a043be5a0b75245954437e009d47d";
          hash = "sha256-uPE73afRW4kSn0MbWgJMXjOv3LLcN/cDDtsYU7L0gF4=";
        };
      })
    ];

    plugins = {
      markdown-preview.enable = true;
      lazy.enable = true;
      which-key.enable = true;
      wrapping = {
        enable = true;
      };
      ts-autotag = {
        enable = true;
      };
      yanky.enable = true;
      treesitter-context.enable = true;
      mini = {
        enable = true;
        modules = {
          indentscope = {
            symbol = "▏";
          };
        };
      };
      gitsigns.enable = true;
      indent-blankline = {
        enable = true;
        settings = {
          indent = {
            char = "▏";
            tab_char = "▏";
          };
        };
      };
      lualine = {
        enable = true;
        settings.options = {
          component_separators = {
            left = "|";
            right = "|";
          };
          section_separators = {
            left = "";
            right = "";
          };
        };
      };
      telescope = {
        enable = true;
        keymaps = {
          "<leader>fg" = "live_grep";
          "<leader>ff" = "find_files";
        };
      };
      treesitter = {
        enable = true;
        settings = {
          auto_install = true;
          highlight.enable = true;
        };
      };
      noice.enable = true;
      neo-tree = {
        enable = true;
        window = {
          position = "float";
        };
      };
      conform-nvim = {
        enable = true;
        settings = {
          formatters_by_ft = {
            svelte = ["prettier"];
            typsecript = ["prettier"];
            javascript = ["prettier"];
            python = ["ruff_organize_imports" "ruff_format"];
            rust = ["rustfmt"];
            nix = ["alejandra"];
            json = ["fixjson"];
            yaml = ["yamlfix"];
            toml = ["taplo"];
            htmldjango = ["djlint"];
            zig = ["zigfmt"];
          };
        };
      };
      web-devicons.enable = true;
      lsp = {
        enable = true;
        servers = {
          glsl_analyzer.enable = true;
          nil_ls.enable = true;
          gleam.enable = true;
          ocamllsp.enable = true;
          svelte.enable = true;
          ts_ls.enable = true;
          ruff.enable = true;
          pyright.enable = true;
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          jsonls.enable = true;
          taplo.enable = true;
          solc = {
            enable = true;
            cmd = [
              "--remappings"
              "@remappings.txt"
            ];
          };
          zls.enable = true;
          gopls.enable = true;
          html.enable = true;
        };
        keymaps = {
          diagnostic = {
            "<leader>cd" = {
              action = "open_float";
              desc = "Line Diagnostics";
            };
            "[d" = {
              action = "goto_prev";
              desc = "Go to prev diagnostic";
            };
            "]d" = {
              action = "goto_next";
              desc = "Go to next diagnostic";
            };

            "<leader>ld" = {
              action = "open_float";
              desc = "Show Line Diagnostics";
            };
          };

          lspBuf = {
            "<leader>ca" = {
              action = "code_action";
              desc = "Code Actions";
            };
            "<leader>rn" = {
              action = "rename";
              desc = "Rename Symbol";
            };
            "<leader>fm" = {
              action = "format";
              desc = "Format";
            };
            "gd" = {
              action = "definition";
              desc = "Goto definition (assignment)";
            };
            "gD" = {
              action = "declaration";
              desc = "Goto declaration (first occurrence)";
            };
            "gy" = {
              action = "type_definition";
              desc = "Goto Type Defition";
            };
            "gi" = {
              action = "implementation";
              desc = "Goto Implementation";
            };
            "<leader>K" = {
              action = "hover";
              desc = "Hover";
            };
            "<leader>sh" = {
              action = "signature_help";
              desc = "Signature Help";
            };
            "<leader>gr" = {
              action = "references";
              desc = "References to thing";
            };
            "<leader>vws" = {
              action = "workspace_symbol";
              desc = "Workspace symbol";
            };
          };
        };
      };
      harpoon = {
        enable = true;
        enableTelescope = true;
      };
    };
  };
}
