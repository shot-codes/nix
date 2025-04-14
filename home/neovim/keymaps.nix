{...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    keymaps = [
      {
        mode = "i";
        action = "<Esc>";
        key = "jk";
        options = {
          noremap = true;
          silent = true;
        };
      }

      # Harpoon
         {
            mode = "n";
            key = "<leader>ha";
            action.__raw = "function() require'harpoon':list():add() end";
          }
          {
            mode = "n";
            key = "<leader>e";
            action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
          }
          {
            mode = "n";
            key = "<C-j>";
            action.__raw = "function() require'harpoon':list():select(1) end";
          }
          {
            mode = "n";
            key = "<C-k>";
            action.__raw = "function() require'harpoon':list():select(2) end";
          }
          {
            mode = "n";
            key = "<C-l>";
            action.__raw = "function() require'harpoon':list():select(3) end";
          }
          {
            mode = "n";
            key = "<C-m>";
            action.__raw = "function() require'harpoon':list():select(4) end";
          }


      # Conform
      {
        mode = "n";
        key = "<leader>fm";
        action = ''
          <cmd>lua require("conform").format()<cr>
        '';
        options = {
          desc = "Format";
        };
      }

      # Neotree
      {
        mode = "n";
        key = "<leader>t";
        action = ''
          <cmd>lua require("neo-tree.command").execute({ toggle = true })<cr>
        '';
      }

      # Windows
      {
        mode = "n";
        action = "<C-W>v";
        key = "<leader>|";
        options = {
          desc = "Split Window Right";
          remap = true;
        };
      }
      {
        mode = "n";
        action = "<C-W>s";
        key = "<leader>-";
        options = {
          desc = "Split Window Below";
          remap = true;
        };
      }
      {
        mode = "n";
        action = "<C-w>h";
        key = "<C-h>";
        options = {
          desc = "Go to Left Window";
          remap = true;
        };
      }
      {
        mode = "n";
        action = "<C-w>j";
        key = "<C-j>";
        options = {
          desc = "Go to Lower Window";
          remap = true;
        };
      }
      {
        mode = "n";
        action = "<C-w>k";
        key = "<C-k>";
        options = {
          desc = "Go to Upper Window";
          remap = true;
        };
      }
      {
        mode = "n";
        action = "<C-w>l";
        key = "<C-l>";
        options = {
          desc = "Go to Right Window";
          remap = true;
        };
      }

      # Move lines
      {
        mode = "n";
        action = "<cmd>m .+1<cr>==";
        key = "<A-j>";
        options = {
          desc = "Move Down";
        };
      }
      {
        mode = "n";
        action = "<cmd>m .-2<cr>==";
        key = "<A-k>";
        options = {
          desc = "Move Up";
        };
      }
      {
        mode = "i";
        action = "<esc><cmd>m .+1<cr>==gi";
        key = "<A-j>";
        options = {
          desc = "Move Down";
        };
      }
      {
        mode = "i";
        action = "<esc><cmd>m .-2<cr>==gi";
        key = "<A-k>";
        options = {
          desc = "Move Up";
        };
      }
      {
        mode = "v";
        action = ":m '>+1<cr>gv=gv";
        key = "<A-j>";
        options = {
          desc = "Move Down";
        };
      }
      {
        mode = "v";
        action = ":m '<-2<cr>gv=gv";
        key = "<A-k>";
        options = {
          desc = "Move Up";
        };
      }

      # Search
      {
        mode = ["i" "n"];
        action = "<cmd>noh<cr><esc>";
        key = "<esc>";
        options = {
          desc = "Escape and Clear hlsearch";
        };
      }
    ];
  };
}
