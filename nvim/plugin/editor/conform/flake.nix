{
  description = "Conform configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.plugins = [ pkgs.vimPlugins.conform-nvim ];
          # Install formatters
          programs.neovim.extraPackages = with pkgs; [
            shfmt
            stylua
            buildifier
            # biome is already installed by the lsp/javascript flake
          ];
          xdg.configFile."nvim/plugin/conform.lua".source = ./config.lua;
        }
      );
    };
}
