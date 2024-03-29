{ config, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      cmp_luasnip.enable = true;
      luasnip.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;

        settings = {
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
    };

    extraConfigLua = ''
      require('luasnip.loaders.from_vscode').lazy_load()

      function check_backspace()
        local col = vim.fn.col(".") - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
      end
    '';
  };
}
