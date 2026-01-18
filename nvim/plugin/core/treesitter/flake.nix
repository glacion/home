{
  description = "Treesitter configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.nvim-treesitter.withAllGrammars ];
          xdg.configFile."nvim/plugin/treesitter.lua".source = ./config.lua;
        }
      );
    };
}
