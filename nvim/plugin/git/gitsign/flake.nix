{
  description = "Gitsigns configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.gitsigns-nvim ];
          xdg.configFile."nvim/plugin/gitsigns.lua".text = "require('gitsigns').setup()";
        }
      );
    };
}
