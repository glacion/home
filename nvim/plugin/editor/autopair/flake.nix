{
  description = "Autopairs configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.nvim-autopairs ];
          xdg.configFile."nvim/plugin/autopairs.lua".source = ./config.lua;
        }
      );
    };
}
