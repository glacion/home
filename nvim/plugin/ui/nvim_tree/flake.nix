{
  description = "Nvim Tree configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.nvim-tree-lua ];
          xdg.configFile."nvim/plugin/nvim_tree.lua".source = ./config.lua;
        }
      );
    };
}
