{
  description = "LuaSnip configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = with pkgs.vimPlugins; [
            luasnip
            friendly-snippets # Dependency
          ];
          xdg.configFile."nvim/plugin/luasnip.lua".source = ./config.lua;
        }
      );
    };
}
