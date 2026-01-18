{
  description = "Nixd LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          programs.neovim.extraPackages = [ pkgs.nixd ];
          xdg.configFile."nvim/plugin/nixd.lua".source = ./nixd.lua;
        }
      );
    };
}
