{
  description = "Nvim-colorizer configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.nvim-colorizer-lua ];
          xdg.configFile."nvim/plugin/colorizer.lua".source = ./config.lua;
        }
      );
    };
}
