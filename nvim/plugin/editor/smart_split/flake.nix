{
  description = "Smart Splits configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.smart-splits-nvim ];
          xdg.configFile."nvim/plugin/smart_splits.lua".source = ./config.lua;
        }
      );
    };
}
