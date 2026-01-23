{ pkgs, ... }: {
  programs.neovim.extraPackages = [ pkgs.lua-language-server ];
  xdg.configFile."nvim/plugin/lua_ls.lua".source = ./lua_ls.lua;
}
