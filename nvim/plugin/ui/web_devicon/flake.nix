{
  description = "Web Devicons configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.nvim-web-devicons ];
        }
      );
    };
}
