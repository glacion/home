{
  description = "Mini Surround configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.mini-nvim ];
          xdg.configFile."nvim/plugin/mini_surround.lua".source = ./config.lua;
        }
      );
    };
}
