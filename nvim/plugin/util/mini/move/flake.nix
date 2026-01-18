{
  description = "Mini Move configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.mini-nvim ];
          xdg.configFile."nvim/plugin/mini_move.lua".source = ./config.lua;
        }
      );
    };
}
