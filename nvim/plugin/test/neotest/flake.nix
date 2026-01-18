{
  description = "Neotest configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [
            pkgs.vimPlugins.neotest
            pkgs.vimPlugins.neotest-go
            pkgs.vimPlugins.neotest-python
          ];
          xdg.configFile."nvim/plugin/neotest.lua".source = ./config.lua;
        }
      );
    };
}
