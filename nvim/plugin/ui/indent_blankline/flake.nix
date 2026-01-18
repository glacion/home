{
  description = "Indent-blankline configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.indent-blankline-nvim ];
          xdg.configFile."nvim/plugin/indent_blankline.lua".source = ./config.lua;
        }
      );
    };
}
