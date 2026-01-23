{ pkgs, ... }: {
  programs.neovim.plugins = [ pkgs.vimPlugins.luasnip ];
  xdg.configFile."nvim/plugin/luasnip.lua".source = ./config.lua;
}
