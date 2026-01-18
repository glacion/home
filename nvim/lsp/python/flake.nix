{
  description = "Python LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.extraPackages = [
            pkgs.ruff
            pkgs.ty
          ];
          xdg.configFile."nvim/plugin/ruff.lua".source = ./ruff.lua;
          xdg.configFile."nvim/plugin/ty.lua".source = ./ty.lua;
        }
      );
    };
}
