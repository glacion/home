{
  description = "Neovim configuration flake";
  outputs =
    { ... }:
    {
      default =
        { ... }:
        {
          imports = [
            ((import ./core/flake.nix).outputs { }).default
            ((import ./plugin/flake.nix).outputs { }).default
            ((import ./lsp/flake.nix).outputs { }).default
          ];
          programs.neovim = {
            enable = true;
            defaultEditor = true;
            viAlias = true;
            vimAlias = true;
          };
        };
    };
}
