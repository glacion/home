{
  description = "Barbar configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.barbar-nvim ];
          xdg.configFile."nvim/plugin/barbar.lua".source = ./config.lua;
        }
      );
    };
}
