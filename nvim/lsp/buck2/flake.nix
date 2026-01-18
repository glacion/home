{
  description = "Buck2 LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          # buck2 is already in core/home.nix
          xdg.configFile."nvim/plugin/buck2.lua".source = ./buck2.lua;
        }
      );
    };
}
