# Todos
# - lsp for python, react/next
# - formatting for  python, rust, react/next
# - auto close brackets
# - yank highlight
# - indent lines
# - auto indent?
# - autcompletion?
{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  programs.nixvim = {
    enable = true;
    viAlias = true;
    defaultEditor = true;
    colorscheme = "alabaster";
    clipboard.register = "unnamedplus";

    keymaps = import ./keymaps.nix;

    opts = {
      number = true;
      shiftwidth = 4;
      expandtab = true;
      tabstop = 4;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "no";
    };

    globals = {
      mapleader = " ";
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
      lualine = {
        enable = true;
        componentSeparators = {
          left = "|";
          right = "|";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };
      };
      telescope.enable = true;
      treesitter.enable = true;
      noice.enable = true;
      neo-tree = {
        enable = true;
      };
      conform-nvim = {
        enable = true;
        formattersByFt = {
          svelte = ["prettier"];
          typsecript = ["prettier"];
          javascript = ["prettier"];
          python = ["ruff_organize_imports" "ruff_format"];
          rust = ["rust-fmt"];
          nix = ["alejandra"];
        };
      };
      lsp = {
        enable = true;
        servers = {
          nil_ls.enable = true;
          svelte.enable = true;
          tsserver.enable = true;
          rust-analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
        keymaps = {
          diagnostic = {
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
            "<leader>f" = {
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
          toggleQuickMenu = "<C-e>";
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
