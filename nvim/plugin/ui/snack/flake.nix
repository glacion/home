{
  description = "Snacks configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.snacks-nvim ];
          xdg.configFile."nvim/plugin/snacks.lua".source = ./config.lua;
        }
      );
    };
}
