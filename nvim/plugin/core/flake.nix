{
  description = "Core plugin configuration";
  outputs =
    { ... }:
    {
      default = {
        imports = [
          ((import ./treesitter/flake.nix).outputs { }).default
        ];
      };
    };
}
