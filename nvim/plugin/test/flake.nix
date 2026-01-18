{
  description = "Test plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./neotest/flake.nix).outputs { }).default
        ];
      };
    };
}
