{
  description = "Blink configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.blink-cmp ];
          xdg.configFile."nvim/plugin/blink.lua".source = ./config.lua;
        }
      );
    };
}
