{
  description = "Undotree configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.undotree ];
          xdg.configFile."nvim/plugin/undotree.lua".source = ./config.lua;
        }
      );
    };
}
