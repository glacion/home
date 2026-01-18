{
  description = "Plugin registration flake";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./completion/flake.nix).outputs { }).default
          ((import ./core/flake.nix).outputs { }).default
          ((import ./debug/flake.nix).outputs { }).default
          ((import ./editor/flake.nix).outputs { }).default
          ((import ./git/flake.nix).outputs { }).default
          ((import ./test/flake.nix).outputs { }).default
          ((import ./ui/flake.nix).outputs { }).default
          ((import ./util/flake.nix).outputs { }).default
        ];
      };
    };
}
