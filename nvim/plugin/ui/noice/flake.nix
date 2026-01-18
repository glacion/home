{
  description = "Noice configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = with pkgs.vimPlugins; [
            noice-nvim
            nui-nvim # Dependency
          ];
          xdg.configFile."nvim/plugin/noice.lua".source = ./config.lua;
        }
      );
    };
}
