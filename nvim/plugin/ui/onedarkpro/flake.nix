{
  description = "Onedarkpro configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.onedarkpro-nvim ];
          xdg.configFile."nvim/lua/color.lua".source = ./color.lua;
          xdg.configFile."nvim/plugin/onedarkpro.lua".source = ./config.lua;
        }
      );
    };
}
