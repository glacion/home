{
  description = "Rust LSP configuration";
  outputs =
    { ... }:
    {
      default = (
        { pkgs, ... }:
        {
          # rust-analyzer is provided by the toolchain in rust/flake.nix
          programs.neovim.extraPackages = [ ];
          xdg.configFile."nvim/plugin/rust_analyzer.lua".source = ./rust_analyzer.lua;
        }
      );
    };
}
