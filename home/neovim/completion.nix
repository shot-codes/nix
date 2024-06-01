{
  programs.nixvim = {
    opts.completeopt = ["menu" "menuone" "noselect"];

    plugins = {
      luasnip.enable = true;
      nvim-autopairs.enable = true;

      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            luasnip = "[snip]";
            buffer = "[buffer]";
            cmp_tabby = "[Tabby]";
          };
        };
      };

      cmp = {
        enable = true;

        settings = {
          snippet.expand = "function(args) require('luasnip').lsp_expand(args.body) end";

          # mapping = {
          #   "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          #   "<C-f>" = "cmp.mapping.scroll_docs(4)";
          #   "<C-Space>" = "cmp.mapping.complete()";
          #   "<C-e>" = "cmp.mapping.close()";
          #   "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          #   "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          #   "<CR>" = "cmp.mapping.confirm({ select = true })";
          # };
          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(function(fallback)
              local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
              end
              if cmp.visible() then
                cmp.select_next_item()
              elseif require('luasnip').expand_or_jumpable() then
                vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require('luasnip').jumpable(-1) then
                vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
              else
                fallback()
              end
            end, {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = false })";
          };

          sources = [
            {name = "path";}
            {name = "nvim_lsp";}
            {name = "cmp_tabby";}
            {name = "luasnip";}
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }
          ];
        };
      };
    };
  };
}
