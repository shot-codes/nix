# Todos
# - lsp for react/next
# - formatting for react/next
# - yank highlight
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
          rev = "2916f15bfd0f77c2b320f0badd338ea2d00add93";
          hash = "sha256-1n9APeQK8lFFv5i+6n7ZkBIxHb/M8goXTftDqWVV/i4=";
        };
      })
    ];

    plugins = {
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
      treesitter.enable = true;
      treesitter.settings.highlight.enable = true;
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
            rust = ["rust-fmt"];
            nix = ["alejandra"];
            json = ["fixjson"];
            yaml = ["yamlfix"];
          };
        };
      };
      web-devicons.enable = true;
      lsp = {
        enable = true;
        servers = {
          nil-ls.enable = true;
          svelte.enable = true;
          ts-ls.enable = true;
          ruff.enable = true;
          pyright.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          jsonls.enable = true;
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
        keymapsSilent = true;
        keymaps = {
          addFile = "<leader>ha";
          toggleQuickMenu = "<leader>e";
          navFile = {
            "1" = "<leader>hj";
            "2" = "<leader>hk";
            "3" = "<leader>hl";
            "4" = "<leader>hm";
          };
        };
      };
    };
  };
}
