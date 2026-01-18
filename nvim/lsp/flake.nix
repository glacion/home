{
  description = "LSP configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./attach/flake.nix).outputs { }).default
          ((import ./buck2/flake.nix).outputs { }).default
          ((import ./docker/flake.nix).outputs { }).default
          ((import ./go/flake.nix).outputs { }).default
          ((import ./javascript/flake.nix).outputs { }).default
          ((import ./lua/flake.nix).outputs { }).default
          ((import ./nixd/flake.nix).outputs { }).default
          ((import ./python/flake.nix).outputs { }).default
          ((import ./rust/flake.nix).outputs { }).default
          ((import ./shell/flake.nix).outputs { }).default
          ((import ./terraform/flake.nix).outputs { }).default
          ((import ./toml/flake.nix).outputs { }).default
          ((import ./yaml/flake.nix).outputs { }).default
        ];
      };
    };
}
